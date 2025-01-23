use std::io::{Read, Write};

const MOD: u32 = 998244353;
const CAP: usize = 501;

fn main() {
    let buf: &_ = {
        let mut buf = String::with_capacity(100_000);
        let mut stdin = std::io::stdin().lock();
        stdin.read_to_string(&mut buf).unwrap();
        buf.leak()
    };
    #[cfg(unix)]
    let mut lines = buf.split("\n");
    #[cfg(windows)]
    let mut lines = buf.split("\r\n");
    let mut stdout = std::io::stdout().lock();

    let mut pixmem = [(0u32, 0u32); CAP];
    let mut pmem = [0u32; CAP];
    let mut ixmem = [0u32; CAP];
    let mut smem = [0u32; CAP];
    let mut rmem = [m32(0); CAP];
    let mut polymem = [m32(0); CAP * 20];
    let mut heapmem = Vec::with_capacity(CAP);
    let t = lines.next().unwrap().parse::<u32>().unwrap();
    for _ in 0..t {
        let n = lines.next().unwrap().parse::<usize>().unwrap();
        for (i, p) in lines.next().unwrap().split(' ').enumerate() {
            pixmem[i] = (p.parse().unwrap(), i as _);
        }
        for (i, s) in lines.next().unwrap().split(' ').enumerate() {
            smem[i] = s.parse().unwrap();
        }
        heapmem = solve(
            n,
            &mut pixmem[..n],
            &mut pmem[..n],
            &mut ixmem[..n],
            &mut smem[..n],
            &mut rmem[..n],
            &mut polymem,
            heapmem,
        );
        for i in 0..n {
            write!(stdout, "{} ", rmem[i].0).unwrap();
        }
        writeln!(stdout).unwrap();
    }
    std::mem::forget(heapmem);
}

fn solve(
    n: usize,
    pixs: &mut [(u32, u32)],
    ps: &mut [u32],
    ixs: &mut [u32],
    ss: &mut [u32],
    rs: &mut [m32],
    polymem: &mut [m32],
    mut heapmem: Vec<std::cmp::Reverse<OrdByLen>>,
) -> Vec<std::cmp::Reverse<OrdByLen>> {
    pixs.sort_unstable();
    ss.sort_unstable();

    for i in 0..n {
        let (pp, pi) = pixs[i];
        ps[i] = pp;
        ixs[i] = pi;
    }

    let mut f = |pi: usize, si: usize, heapmem: Vec<std::cmp::Reverse<OrdByLen>>| {
        let q = ps[pi] + ss[si];

        let mut size = 0;
        let mut polys = heapmem;
        polys.clear();

        let (mut pjl, mut pjr);
        let (mut sjl, mut sjr);

        (pjr, sjl) = (0, ss.len());

        while pjr < ps.len() {
            pjl = pjr;
            while pjr < ps.len() && ps[pjr] == ps[pjl] {
                pjr += 1;
            }

            sjr = sjl;
            while sjr > 0 && ps[pjl] + ss[sjr - 1] > q {
                sjr -= 1;
            }
            sjl = sjr;
            while sjl > 0 && ps[pjl] + ss[sjl - 1] >= q {
                sjl -= 1;
            }

            let (pjl, pjr) = (pjl - (pi < pjl) as usize, pjr - (pi < pjr) as usize);
            let (sjl, sjr) = (sjl - (si < sjl) as usize, sjr - (si < sjr) as usize);

            if pjl == pjr {
                continue;
            }

            let mut range = size..size + pjr - pjl + 1;
            size += pjr - pjl + 1;
            for k in 0..(pjr - pjl + 1) {
                let (n, pjl, pjr, sjl, sjr, k) = (n as i32, pjl as i32, pjr as i32, sjl as i32, sjr as i32, k as i32);
                polymem[range.clone()][k as usize] =
                    perm((n - 1) - sjr - pjl, pjr - pjl - k) * binom(pjr - pjl, k) * perm(sjr - sjl, k);
            }

            while range.len() >= 1 {
                if polymem[range.end - 1] != m32(0) {
                    break;
                }
                range.end -= 1;
                size -= 1;
            }
            if range.len() == 0 {
                return (m32(0), polys);
            }

            polys.push(std::cmp::Reverse(OrdByLen(range)));
        }

        if polys.is_empty() {
            return (m32(1), polys);
        }

        let mut polys = std::collections::VecDeque::from(polys);

        while polys.len() >= 2 {
            let (front, back) = polymem.split_at_mut(size);
            let xs = polys.pop_front().unwrap().0.0;
            let ys = polys.pop_front().unwrap().0.0;
            let zs = size..size + xs.len() + ys.len() - 1;
            size += xs.len() + ys.len() - 1;
            convolve(
                &front[xs.clone()],
                &front[ys.clone()],
                &mut back[..xs.len() + ys.len() - 1],
            );
            polys.push_back(std::cmp::Reverse(OrdByLen(zs)));
        }

        let poly = polys.pop_back().unwrap().0.0;

        let mut prob = m32(0);
        for (k, c) in polymem[poly].iter().enumerate() {
            prob += *c / m32((k + 1) as u32);
        }

        (prob, Vec::from(polys))
    };

    let (mut pil, mut pir);
    pir = 0;
    while pir < ps.len() {
        pil = pir;
        while pir < ps.len() && ps[pir] == ps[pil] {
            pir += 1;
        }

        rs[ixs[pil] as usize] = m32(0);
        // for si in (0..(n - n % 2)).step_by(2) {
        //     let (prob, heapmem1) = f(pil, si, heapmem);
        //     heapmem = heapmem1;
        //     rs[ixs[pil] as usize].0 += prob.0;
        //     let (prob, heapmem1) = f(pil, si + 1, heapmem);
        //     heapmem = heapmem1;
        //     rs[ixs[pil] as usize] += prob;
        // }
        // if n % 2 == 1 {
        //     let (prob, heapmem1) = f(pil, n - 1, heapmem);
        //     heapmem = heapmem1;
        //     rs[ixs[pil] as usize] += prob;
        // }
        for si in 0..n {
            let (prob, heapmem1) = f(pil, si, heapmem);
            heapmem = heapmem1;
            rs[ixs[pil] as usize] += prob;
        }

        for pi in (pil..pir).skip(1) {
            rs[ixs[pi] as usize] = rs[ixs[pi - 1] as usize];
        }
    }

    for r in rs {
        *r *= FACT_INV[n];
    }

    heapmem
}

fn convolve(xs: &[m32], ys: &[m32], zs: &mut [m32]) {
    zs.fill(m32(0));
    for d in 0..zs.len() {
        const BATCH: usize = 3;
        let lower_bound = isize::max(0, d as isize - ys.len() as isize + 1) as usize;
        let upper_bound = usize::min(xs.len(), d + 1);
        let full_range = lower_bound..upper_bound;
        let truncated_range = lower_bound..upper_bound - full_range.len() % BATCH;
        unsafe {
            for i in truncated_range.step_by(BATCH) {
                for j in 0..BATCH {
                    zs.get_unchecked_mut(d).0 += (*xs.get_unchecked(i + j) * *ys.get_unchecked(d - (i + j))).0;
                }
                zs.get_unchecked_mut(d).0 %= MOD;
            }
            if full_range.len() % BATCH != 0 {
                for i in upper_bound - full_range.len() % BATCH..upper_bound {
                    zs.get_unchecked_mut(d).0 += (*xs.get_unchecked(i) * *ys.get_unchecked(d - i)).0;
                }
                zs.get_unchecked_mut(d).0 %= MOD;
            }
        }
    }
}

struct OrdByLen(std::ops::Range<usize>);
impl PartialEq for OrdByLen {
    #[inline]
    fn eq(&self, other: &Self) -> bool {
        usize::eq(&self.0.len(), &other.0.len())
    }
}
impl Eq for OrdByLen {}
impl PartialOrd for OrdByLen {
    #[inline]
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        usize::partial_cmp(&self.0.len(), &other.0.len())
    }
}
impl Ord for OrdByLen {
    #[inline]
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        usize::cmp(&self.0.len(), &other.0.len())
    }
}

#[inline]
fn binom(n: i32, k: i32) -> m32 {
    if !(0..=n).contains(&k) {
        return m32(0);
    }
    unsafe {
        *FACT.get_unchecked(n as usize)
            * *FACT_INV.get_unchecked(k as usize)
            * *FACT_INV.get_unchecked((n - k) as usize)
    }
}

#[inline]
fn perm(n: i32, k: i32) -> m32 {
    if !(0..=n).contains(&k) {
        return m32(0);
    }
    unsafe { *FACT.get_unchecked(n as usize) * *FACT_INV.get_unchecked((n - k) as usize) }
}

const FACT: [m32; CAP] = fact().0;
const FACT_INV: [m32; CAP] = fact().1;
const fn fact() -> ([m32; CAP], [m32; CAP]) {
    let mut fact = [m32(0); CAP];
    let mut fact_inv = [m32(0); CAP];
    fact[0] = m32(1);
    fact_inv[0] = m32(1);

    let mut i = 1;
    while i < CAP {
        fact[i].0 = ((fact[i - 1].0 as u64 * i as u64) % MOD as u64) as u32;
        let i_inv = inverse(i as u32);
        fact_inv[i].0 = ((fact_inv[i - 1].0 as u64 * i_inv as u64) % MOD as u64) as u32;
        i += 1;
    }

    (fact, fact_inv)
}

#[inline]
const fn inverse(a: u32) -> u32 {
    let (mut s, mut old_s) = (0, 1);
    let (mut r, mut old_r) = (MOD as i64, a as i64);

    while r != 0 {
        let quotient = old_r / r;
        (old_r, r) = (r, old_r - quotient * r);
        (old_s, s) = (s, old_s - quotient * s);
    }

    if old_s < 0 { (old_s + MOD as i64) as u32 } else { old_s as u32 }
}

#[allow(non_camel_case_types)]
#[repr(transparent)]
#[derive(Debug, Default, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
struct m32(u32);
impl std::ops::Add for m32 {
    type Output = Self;
    #[inline]
    fn add(self, rhs: Self) -> Self::Output {
        Self((self.0 + rhs.0) % MOD)
    }
}
impl std::ops::AddAssign for m32 {
    #[inline]
    fn add_assign(&mut self, rhs: Self) {
        *self = *self + rhs;
    }
}
impl std::ops::Sub for m32 {
    type Output = Self;
    #[inline]
    fn sub(self, rhs: Self) -> Self::Output {
        Self((self.0 + (MOD - rhs.0)) % MOD)
    }
}
impl std::ops::SubAssign for m32 {
    #[inline]
    fn sub_assign(&mut self, rhs: Self) {
        *self = *self - rhs;
    }
}
impl std::ops::Mul for m32 {
    type Output = Self;
    #[inline]
    fn mul(self, rhs: Self) -> Self::Output {
        let p = self.0 as u64 * rhs.0 as u64;
        Self((p % MOD as u64) as u32)
    }
}
impl std::ops::MulAssign for m32 {
    #[inline]
    fn mul_assign(&mut self, rhs: Self) {
        *self = *self * rhs;
    }
}
impl std::ops::Div for m32 {
    type Output = Self;
    #[inline]
    fn div(self, rhs: Self) -> Self::Output {
        self * Self(inverse(rhs.0))
    }
}
impl std::ops::DivAssign for m32 {
    #[inline]
    fn div_assign(&mut self, rhs: Self) {
        *self = *self / rhs;
    }
}