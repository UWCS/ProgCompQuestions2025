import sys
import random


def generate_test_case(n, k, max_weight=10 ** 9, seed=None):
    if seed is not None:
        random.seed(seed)
    edges = []

    # Generate a random tree using a randomized version of the Prüfer sequence
    nodes = list(range(2, n + 1))
    random.shuffle(nodes)
    for node in nodes:
        # Connect to a random existing node (1 to node-1)
        u = random.randint(1, node - 1)
        v = node
        w = random.randint(1, max_weight)
        edges.append((u, v, w))

    # Generate the list of money nodes
    if k == 0:
        money_nodes = []
    else:
        money_nodes = random.sample(range(1, n + 1), k)

    return n, edges, k, money_nodes


def main():
    import argparse
    # 4 + 20 + 40 + 20 + 12 + 3 + 1

    parser = argparse.ArgumentParser(description='Generate test cases for the Treejumper problem.')
    parser.add_argument('-t', type=int, default=1, help='Number of test cases to generate (1 <= t <= 100)')
    parser.add_argument('--min_n', type=int, default=500000, help='Minimum number of nodes in a tree (1 <= min_n)')
    parser.add_argument('--max_n', type=int, default=500000,
                        help='Maximum number of nodes in a tree (min_n <= max_n <= 5e5)')
    parser.add_argument('--min_k', type=int, default=0,
                        help='Minimum number of money nodes in a test case (0 <= min_k <= max_k)')
    parser.add_argument('--max_k', type=int, default=500000,
                        help='Maximum number of money nodes in a test case (min_k <= max_k <= n)')
    parser.add_argument('--max_weight', type=int, default=10**9, help='Maximum edge weight (1 <= w_i <= 10^9)')
    parser.add_argument('--seed', type=int, default=None, help='Random seed for reproducibility')
    parser.add_argument('--output', type=str, default='me.txt', help='Output file to append test cases')
    args = parser.parse_args()

    t = args.t
    min_n = args.min_n
    max_n = args.max_n
    min_k = args.min_k
    max_k = args.max_k
    max_weight = args.max_weight
    seed = args.seed
    output_file = args.output

    # Validate arguments
    if not (1 <= t <= 100):
        print("Error: Number of test cases t must be between 1 and 100.")
        sys.exit(1)
    if not (1 <= min_n <= max_n <= 5 * 10 ** 5):
        print("Error: Ensure that 1 <= min_n <= max_n <= 5e5.")
        sys.exit(1)
    if not (0 <= min_k <= max_k):
        print("Error: Ensure that 0 <= min_k <= max_k.")
        sys.exit(1)

    if seed is not None:
        random.seed(seed)

    try:
        with open(output_file, "a") as f:
          #  f.write(f"{t}\n")
            for _ in range(t):
                n = random.randint(min_n, max_n)
                # Ensure that k does not exceed n
                current_max_k = min(max_k, n)
                current_min_k = min(min_k, current_max_k)
                k = random.randint(current_min_k, current_max_k)
                test_n, edges, k, money_nodes = generate_test_case(n, k, max_weight)
                f.write(f"{test_n}\n")
                for u, v, w in edges:
                    f.write(f"{u} {v} {w}\n")
                f.write(f"{k}\n")
                if k > 0:
                    f.write(' '.join(map(str, money_nodes)) + "\n")
                else:
                    f.write("\n")
        print(f"Test cases appended to {output_file} successfully.")
    except Exception as e:
        print(f"An error occurred while writing to {output_file}: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
