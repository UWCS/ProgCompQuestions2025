n = 93821993237
MOD = 10**9 + 7

def fib(n, mod):
    def fast_doubling(n):
        if n == 0:
            return (0, 1)
        a, b = fast_doubling(n >> 1)
        c = (a * ((2 * b - a) % mod)) % mod
        d = (a * a + b * b) % mod
        if n & 1:
            return (d, (c + d) % mod)
        else:
            return (c, d)
    return fast_doubling(n)[0]

print(fib(n + 2, MOD))