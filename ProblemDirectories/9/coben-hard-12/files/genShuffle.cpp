#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;

int main(int argc, char** argv) {
    // Initialize Testlib environment
    registerGen(argc, argv, 1);

    // Read command-line parameters
    int num_tests = opt<int>("tests", 1);  // Number of test cases to generate
    int min_n = opt<int>("min-n", 1);      // Minimum n per test case
    int max_n = opt<int>("max-n", 100);    // Maximum n per test case

    // Ensure that max_n does not exceed the total allowed sum
    if(max_n > 150) max_n = 150;

    // Initialize remaining_sum_n
    int remaining_sum_n = 150;

    // Check if it's possible to generate the desired number of test cases
    if(num_tests * min_n > remaining_sum_n){
        quitf(_fail, "Cannot generate %d test cases with min-n=%d as it exceeds the total allowed sum_n=150.", num_tests, min_n);
    }

    // Output the number of test cases
    cout << num_tests << "\n";

    for(int testCase = 1; testCase <= num_tests; testCase++) {
        int remaining_tests = num_tests - testCase + 1;
        // Determine the maximum possible n for this test case
        int max_possible_n = min(max_n, remaining_sum_n - (remaining_tests - 1) * min_n);
        int min_possible_n = min_n;
        if(max_possible_n < min_possible_n){
            quitf(_fail, "Test case %d: Not enough remaining sum_n to assign n.", testCase);
        }

        // Randomly choose n within [min_possible_n, max_possible_n]
        int n = rnd.next(min_possible_n, max_possible_n);
        remaining_sum_n -= n;

        // Generate first permutation [0..n-1]
        vector<int> perm1(n);
        for(int i = 0; i < n; i++) perm1[i] = i;
        // Shuffle perm1 using Fisher-Yates algorithm with Testlib's rnd
        for(int i = n - 1; i > 0; i--){
            int j = rnd.next(0, i);
            swap(perm1[i], perm1[j]);
        }

        // Generate second permutation [0..n-1]
        vector<int> perm2(n);
        for(int i = 0; i < n; i++) perm2[i] = i;
        // Shuffle perm2 using Fisher-Yates algorithm with Testlib's rnd
        for(int i = n - 1; i > 0; i--){
            int j = rnd.next(0, i);
            swap(perm2[i], perm2[j]);
        }

        // Output the test case
        cout << n << "\n";

        // Output first permutation
        for(int i = 0; i < n; i++) {
            cout << perm1[i] << (i < n-1 ? " " : "\n");
        }

        // Output second permutation
        for(int i = 0; i < n; i++) {
            cout << perm2[i] << (i < n-1 ? " " : "\n");
        }
    }

    return 0;
}
