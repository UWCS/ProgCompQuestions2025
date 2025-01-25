def main():
    import sys
    sys.setrecursionlimit(1 << 25)
    input = sys.stdin.read().split()
    ptr = 0
    t = int(input[ptr]);
    ptr += 1
    results = []

    for _1 in range(t):
        n = int(input[ptr]);
        ptr += 1
        adj = [[] for _ in range(n + 1)]

        for _ in range(n - 1):
            u = int(input[ptr]);
            ptr += 1
            v = int(input[ptr]);
            ptr += 1
            w = int(input[ptr]);
            ptr += 1
            adj[u].append((v, w))
            adj[v].append((u, w))

        k = int(input[ptr]);
        ptr += 1
        jewels = []
        if k > 0:
            jewels = list(map(int, input[ptr:ptr + k]))
            ptr += k

        has_jewel = [False] * (n + 1)
        for node in jewels:
            has_jewel[node] = True

        sum_edges = 0
        max_depth = 0
        root = 1

        print(f"Case #{1 + _1}: n = {n}", file=sys.stderr)

        def dfs(node, parent, current_depth):
            nonlocal sum_edges, max_depth
            subtree_has_jewel = has_jewel[node]
            if subtree_has_jewel:
                max_depth = max(max_depth, current_depth)
            for child, weight in adj[node]:
                if child != parent:
                    child_has_jewel = dfs(child, node, current_depth + weight)
                    if child_has_jewel:
                        subtree_has_jewel = True
                        sum_edges += weight
            return subtree_has_jewel

        if k > 0:
            dfs(root, -1, 0)
            result = 2 * sum_edges - max_depth
        else:
            result = 0
        results.append(result)

    for res in results:
        print(res)


if __name__ == "__main__":
    import sys

    sys.stdin = open('input/larger.txt', 'r')  # Ensure your input file path is correct
    sys.stdout = open('me.txt', 'w')  # Output will be written to 'me.txt'
    main()
