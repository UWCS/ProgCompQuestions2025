//#pragma GCC optimize("O3,unroll-loops")
//#pragma GCC target("avx2,bmi,bmi2,lzcnt,popcnt")
#include <bits/stdc++.h>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef __int128 lll;
//typedef __float128 fl;
typedef unsigned long long ull;
typedef vector<int> vi;
typedef vector<ll> vll;
typedef vector<ull> vull;
typedef vector<lll> vlll;
typedef pair<int, int> pi;
typedef pair<ll, ll> pll;
const ll INF = LONG_LONG_MAX - 1;
const int MOD = 1e9 + 7;
const int MOD2 = 998244353;
int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};
const double PI = 3.14159265358979323846;
#define fast_io ios::sync_with_stdio(false);cin.tie(0);cout.tie(0);
#define print(a) cout << (a) << "\n";
#define printPair(a) cout << (a).first << " " << (a).second << "\n";

#define debug(...) fprintf(stderr, __VA_ARGS__), fflush(stderr)
#define time__(d) \
    for ( \
        auto blockTime = make_pair(chrono::high_resolution_clock::now(), true); \
        blockTime.second; \
        debug("%s: %lld ms\n", d, chrono::duration_cast<chrono::milliseconds>(chrono::high_resolution_clock::now() - blockTime.first).count()), blockTime.second = false \
    )

void put(bool p) {
    print(p ? "YES" : "NO");
}

template<typename T>
int sgn(T val) {
    gcd(2,3);
    return (T(0) < val) - (val < T(0));
}

std::ostream& operator<<(std::ostream& o, const __int128& x) {
    if (x == std::numeric_limits<__int128>::min()) return o << "0"; //170141183460469231731687303715884105728
    if (x < 0) return o << "-" << -x;
    if (x < 10) return o << (char)(x + '0');
    return o << x / 10 << (char)(x % 10 + '0');
}

unsigned long long binpow(ull a, ull b, ll M = MOD) {
    a %= M;
    ull res = 1;
    while (b > 0) {
        // this is really smart, its basically cycling through all binary digits and if there's a 1 there, multiply res by it!
        if (b & 1) // bit hacky way of checking b % 2 == 1
            res = (res * a) % M;
        a = (a * a) % M;
        b >>= 1;
    }
    return res % M;
}

/*long long int mod(long long int a, long long int b) {
    long long int ret = a % b;
    if (ret < 0)
        ret += b;
    return ret;
}*/

ll highestPowerof2LessThan(ll v) {
    // check for the set bits
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    v >>= 1;
    return v;
}

ll highestPowerof2LessThanOrEq(ll x) {
    // check for the set bits
    x |= x >> 1;
    x |= x >> 2;
    x |= x >> 4;
    x |= x >> 8;
    x |= x >> 16;
    x |= x >> 32;
    return x ^ (x >> 1);
}

ll smallestPowerOf2HigherThanOrEq(ll v) {
    if (v == 0)
        return 1;
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v |= v >> 32;
    v++;
    return v;
}

ll quickCeil(ll x, ll y) {
    return x / y + (x % y != 0);
}

bool isOverflow(ll a, ll b) {
    return log10(a) + log10(b) > 18;
}

int numberOfOneBits(int x) {
    return __builtin_popcountll(x);
}

ll preciseFloor(ll a, ll b) {
    ll val = a / b;
    while (val * b > a)
        val--;
    return val;
}


void fenwickUpdate(int *a, int n, int i, int val) {
    while (i < n) {
        a[i] += val;
        i += i & -i;
    }
}

int fenwickRightHandQuery(const int *a, int r) {
    int sum = 0;
    while (r > 0) {
        sum += a[r];
        r -= r & -r;
    }
    return sum;
}

int fenwickQuery(int *a, int l, int r) { // assuming one-indexed array!
    return fenwickRightHandQuery(a, r) - fenwickRightHandQuery(a, l - 1);
}

//template<ll mod = MOD>
struct Mint {
    ll x;
    static ll mod;

    Mint() : x(0) {}

    Mint(ll _x) {
        _x %= mod;
        if (_x < 0) _x += mod;
        x = _x;
    }

    Mint &operator+=(const Mint &a) {
        x += a.x;
        if (x >= mod) x -= mod;
        return *this;
    }

    Mint &operator-=(const Mint &a) {
        x += mod - a.x;
        if (x >= mod) x -= mod;
        return *this;
    }

    Mint &operator*=(const Mint &a) {
        x = (ull) x * a.x % mod;
        return *this;
    }

    Mint pow(ll pw) const {
        Mint res = 1;
        Mint cur = *this;
        while (pw) {
            if (pw & 1) res *= cur;
            cur *= cur;
            pw >>= 1;
        }
        return res;
    }

    Mint inv() const {
        assert(x != 0);
        ll t = x;
        ll res = 1;
        while (t != 1) {
            ll z = mod / t;
            res = (ull) res * (mod - z) % mod;
            t = mod - t * z;
        }
        return res;
    }

    Mint &operator/=(const Mint &a) {
        return *this *= a.inv();
    }

    Mint operator+(const Mint &a) const {
        return Mint(*this) += a;
    }

    Mint operator-(const Mint &a) const {
        return Mint(*this) -= a;
    }

    Mint operator*(const Mint &a) const {
        return Mint(*this) *= a;
    }

    Mint operator/(const Mint &a) const {
        return Mint(*this) /= a;
    }

    bool operator==(const Mint &a) const {
        return x == a.x;
    }

    bool operator!=(const Mint &a) const {
        return x != a.x;
    }

    bool operator<(const Mint &a) const {
        return x < a.x;
    }

    friend ostream &operator<<(ostream &out, const Mint &m) {
        out << m.x;
        return out;
    }
};

// using Mint = Mint<MOD>;

struct fenwick { // not one-indexed
    vector<int> a;
    int n;

    fenwick(int ne) {
        n = ne;
        a = vector<int>(n + 1, 0);
    }

    void update(int i, int v) { // later make this subscript overloaded
        i++;
        while (i <= n) {
            a[i] += v;
            i += i & -i;
        }
    }

    int frq(int r) {
        ll sum = 0;
        while (r > 0) {
            sum += a[r];
            r -= r & -r;
        }
        return sum;
    }

    int query(int l, int r) {
        l++;
        r++;
        return frq(r) - frq(l - 1);
    }
};


struct dsu {
    vi parent, s;
    int numCC;

    dsu(int n) {
        parent = vi(n);
        numCC = n;
        s = vi(n, 1);
        for (int i = 1; i < n; ++i)
            parent[i] = i;
    }

    int find(int v) {
        if (v == parent[v])
            return v;
        return parent[v] = find(parent[v]);
    }

    void unite(int u, int v) {
        u = find(u);
        v = find(v);
        if (u != v) {
            numCC--;
            if (s[u] < s[v])
                swap(u, v);
            parent[v] = u;
            s[u] += s[v];
        }
    }

    int getNumConnComp() const {
        return numCC;
    }


};

struct stronglyConnectedComponents {
    int id = 1;
    int scc = 0;
    stack<int> s;
    vi ids,low;
    vector<bool> vis;
    vi repr; // representative
    vector<set<int>> cond; // condensed Graph hu
    vi* adj;
    vi sz;

    stronglyConnectedComponents(vi* g, int n){ // assuming 1 indexed, which it usually always is
        adj = g;
        ids = vi(n+1,-1);
        low = vi(n+1,0);
        vis = vector<bool>(n+1,false);
        cond = vector<set<int>>(n+1);
        sz = vi(n+1);
        repr = vi(n+1);

        for (int i = 1; i <= n; ++i){
            if (ids[i] != -1)
                continue;
            dfs(i);
        }

        for (int i = 1; i <= n; ++i){
            sz[low[i]]++;
            for (auto c: adj[i]){
                if (low[c] == low[i])
                    continue;
                cond[find(i)].insert(find(c));
            }
        }
    }

    void dfs(int v){
        s.push(v);
        vis[v] = true;
        ids[v] = low[v] = id++;

        for (auto c: adj[v]){
            if (ids[c] == -1)
                dfs(c);
            if (vis[c])
                low[v] = min(low[v],low[c]);
        }

        if (ids[v] == low[v]){
            repr[ids[v]] = v;
            while (!s.empty()){
                int x = s.top();
                s.pop();
                vis[x] = false;
                low[x] = ids[v];
                if (x == v)
                    break;
            }
            scc++;
        }
    }

    int getSCCcnt(){
        return scc;
    }

    int find(int a){
        return repr[low[a]];
    }

    bool inSameSCC(int a, int b){
        return find(a) == find(b);
    }
};

bool contains(string& s1, string& s2){
    if (s1.find(s2) != std::string::npos) {
        return true;
    }
    return false;
}

int negMod(ll a, int b){
    int r = a % b;
    return r >= 0 ? r : r + std::abs(b);
}



const int MOD3 = MOD + 2;

struct pair_hash {
    std::size_t operator() (const std::pair<int, int>& p) const {
        return std::hash<int>()(p.first) ^ (std::hash<int>()(p.second) << 1);
    }
};

const int BLOCK_SIZE = 400;
bool mo(array<int,3> q1,array<int,3> q2) {
    if (q1[0] / BLOCK_SIZE != q2[0] / BLOCK_SIZE) {
        return q1[0] < q2[0];
    }

    if ((q1[0] / BLOCK_SIZE) & 1) {
        return q1[1] < q2[1];
    }

    return q1[1] > q2[1];
}

const int MAXN = (int) 5e2 + 20;

/*ll spf[MAXN + 10]; // cler
void sieve(ll n) {
    for (int i = 1; i <= n; ++i)
        spf[i] = i & 1 ? i : 2;
    for (int i = 3; i * i <= n; ++i) {
        if (spf[i] == i) {
            for (int p = i * i; p <= n; p += i) {
                if (spf[p] == p)
                    spf[p] = i;
            }
        }
    }
}*/
ll Mint::mod = MOD2;

//Mint fact[MAXN + 3];
//Mint inv[MAXN + 3];



double TOL = 1e-7;
double facApprox[MAXN+10];


ll fac[MAXN+10];
ll inv[MAXN+10];
ll invRecip[MAXN+10];
void preload(){
    //  sieve(MAXN);
    fac[0] = 1;
    // facApprox[0] = 1;
    for (int i = 1; i <= MAXN; ++i) {
        fac[i] = fac[i - 1] * i;
        fac[i] %= MOD2;
        //   facApprox[i] = facApprox[i-1]*i;
        invRecip[i] = binpow(i,MOD2-2,MOD2);
    }

    inv[MAXN] = binpow(fac[MAXN],MOD2-2,MOD2);
    for (int i = MAXN-1; i >= 0; --i){
        // 1/i! = (i+1)/(i+1)!
        inv[i] = inv[i+1]*(i+1);
        inv[i] %= MOD2;
    }
}

std::vector<ll> convolve(const std::vector<ll>& a, const std::vector<ll>& b) {
    // If either polynomial is empty, the product is empty
    if (a.empty() || b.empty()) {
        return {};
    }

    size_t n = a.size(), m = b.size();
    std::vector<ll> result(n + m - 1, 0);

    // Use pointers and avoid repeated indexing
    const ll* a_ptr = a.data();
    const ll* b_ptr = b.data();
    ll* res_ptr = result.data();

    for (size_t i = 0; i < n; ++i) {
        ll ai = a_ptr[i]; // Cache current coefficient of a
        for (size_t j = 0; j < m; ++j) {
            res_ptr[i + j] += (ai * b_ptr[j]) % MOD2;
            res_ptr[i+j] %= MOD2;
        }
    }

    return result;
}


ll choose(int n, int k){
    if (n < k)
        return 0;
    return (((fac[n]*inv[k]) % MOD2) *inv[n-k]) % MOD2;
}

ll perm(int n, int k){
    if (n < k)
        return 0;
    return (fac[n]*inv[n-k]) % MOD2;
}

struct Compare {
    bool operator()(const vector<ll>& a, const vector<ll>& b) {
        return a.size() > b.size(); // Min-heap: smaller size comes first
    }
};

void solve(int &tc) {
    int n;
    cin >> n;
    vll p1(n);
    vll s(n);
    unordered_map<int, vector<int>> ind;
    ind.reserve(n);
    ind.max_load_factor(0.7f);

    unordered_map<int, int> mp;
    mp.reserve(n);
    mp.max_load_factor(0.7f);

    for (int i = 0; i < n; ++i) {
        cin >> p1[i];
        ind[p1[i]].emplace_back(i);
        mp[p1[i]]++;
    }


    vector<pll> p;
    for (auto &x: mp){
        p.emplace_back(x.first,x.second);
    }
    int m = p.size();

    unordered_map<int, int> freq;
    freq.reserve(n);
    freq.max_load_factor(0.7f);

    for (int i = 0; i < n; ++i) {
        cin >> s[i];
        freq[s[i]]++;
    }

    sort(s.begin(),s.end());
    sort(p.begin(),p.end(),greater<>());

    auto multPoly = [&](const std::vector<std::vector<ll>>& polys) {
        if (polys.empty()) return std::vector<ll>{};
        auto result = polys[0];
        for (size_t i = 1; i < polys.size(); ++i) {
            result = convolve(result, polys[i]);
        }
        return result;
    };


    vector<ll> ans(n);
    auto f = [&](const vector<pll> &p,const vll& s, ll C){
        int m = p.size();
        if (m == 0){
            return vector<ll>{(1)};
        }
        //  vector<pll> b(m);

        int n = s.size();
        int j = n-1;
        pll bm = {C - p[m-1].first,p[m-1].second};
        int TOT = s[j] >= bm.first;

        vector<vector<ll>> polys(m);
        //  priority_queue<vector<Mint>, vector<vector<Mint>>, Compare> polys;


        for (int i = m-1; i >= 0; --i){
            pi bi = {C - p[i].first,p[i].second};
            while (j-1 >= 0 && bi.first <= s[j-1]) {
                j--;
                TOT++;
            }

            int k = bi.second;

            int c = freq[bi.first];
            int d = TOT - c;


            vector<ll> curPoly(1 + min(bi.second,c));
            bool earlyTerminate = true;
            for (int t = 0; t <= min(bi.second,c); ++t){
                curPoly[t] = ((choose(k,t) * perm(c,t)) % MOD2 * perm (d,k-t)) % MOD2;
                earlyTerminate &= curPoly[t] == 0;
            }
            if (earlyTerminate)
                return vector<ll>{(0)};
            TOT -= k;
            polys[i] = curPoly;
            //polys.push(curPoly);
        }

        return multPoly(polys);
    };


    vector<vll> sS(n);
    for (int i = 0; i < n; ++i){
        vll np;
        for (int k = 0; k < n; ++k){
            if (k != i)
                np.emplace_back(s[k]);
        }
        sS[i] = np;
    }


    vector<pll> filtered_p;
    filtered_p.reserve(m);

    for (int i = 0; i < m; ++i){
        p[i].second--;
        for (int j = 0; j < n; ++j){
            freq[s[j]]--;

            ll C = p[i].first + s[j];
            const vector<pll>* np;
            if (p[i].second == 0) {
                filtered_p.clear();
                for(int k = 0; k < m; ++k){
                    if(p[k].second > 0){
                        filtered_p.emplace_back(p[k]);
                    }
                }
                np = &filtered_p;
            } else
                np = &p;

            const auto& ns = sS[j];


            const auto table = f(*np,ns,C);
            ll g = 0;
            for (int k = 0; k < table.size(); ++k){
                g += table[k] * invRecip[k+1];
                g %= MOD2;
            }

            g *= inv[n];
            g %= MOD2;
            for (auto const & x: ind[p[i].first]) {
                ans[x] += g;
                ans[x] %= MOD2;
            }

            freq[s[j]]++;
        }
        p[i].second++;
    }

    for (int i = 0; i < n; ++i)
        cout << ans[i] << " ";
    cout << "\n";
}



int main() {
    fast_io;
    int t;
    t = 1;
    cin >> t;
    time__("solve") {
        preload();
        int x = 0;
        while (t-- > 0) {
            x++;
            solve(x);
        }
    }

    return 0;
}