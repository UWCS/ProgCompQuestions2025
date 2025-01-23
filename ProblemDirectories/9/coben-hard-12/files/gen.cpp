#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;


int main(int argc, char** argv) {
    // Initialize Testlib environment
    registerGen(argc, argv, 1);

    // Read command-line parameters
    int num_tests = opt<int>("tests", 1);         // Number of test cases to generate
    int min_n = opt<int>("min-n", 1);             // Minimum number of Moniforces per test case
    int max_n = opt<int>("max-n", 100);           // Maximum number of Moniforces per test case
    int min_val = opt<int>("min-val", 1);         // Minimum value for p_i and s_i
    int max_val = opt<int>("max-val", 1000000);   // Maximum value for p_i and s_i

    // Ensure that sum of n across all test cases does not exceed 150
    // Adjust num_tests if necessary
    if(max_n > 150) max_n = 150; // Prevent max_n from exceeding 150

    // Initialize remaining_sum_n
    int remaining_sum_n = 150;

    // Check if it's possible to generate the desired number of test cases
    if(num_tests * min_n > remaining_sum_n){
        quitf(_fail, "Cannot generate %d test cases with min-n=%d as it exceeds the total allowed sum_n=100.", num_tests, min_n);
    }

    // Output the number of test cases
    cout << num_tests << "\n";

    for(int testCase = 1; testCase <= num_tests; testCase++) {
        int remaining_tests = num_tests - testCase + 1;
        // Determine the maximum possible n for this test case
        int max_possible_n = min(max_n, remaining_sum_n - (remaining_tests -1)*min_n);
        int min_possible_n = min_n;
        if(max_possible_n < min_possible_n){
            // Adjust if not enough remaining_sum_n
            quitf(_fail, "Test case %d: Not enough remaining sum_n to assign n.", testCase);
        }

        // Randomly choose n within [min_possible_n, max_possible_n]
        int n;
        do {
            n = rnd.next(min_possible_n, max_possible_n);
        } while(n < min_possible_n || n > max_possible_n);

        remaining_sum_n -=n;

        // Generate p_i and s_i, allowing duplicates in s_i, ensuring no ties
        vector<int> p(n), s(n);
        bool valid = false;
        int retry_limit = 1; // To prevent infinite loops
        while(!valid && retry_limit >0){
            // Generate p_i
            for(int i=0; i<n; i++) {
                p[i] = rnd.next(min_val, max_val);
            }

            // Generate s_i (allowing duplicates)
            for(int i=0; i<n; i++) {
                s[i] = rnd.next(min_val, max_val);
            }

            // Check for tie possibilities
            valid = true;

            retry_limit--;
        }

        if(!valid){
            quitf(_fail, "Test case %d: Unable to generate a valid test case without ties after multiple attempts.", testCase);
        }

        // Output the test case
        cout << n << "\n";

        // Output p1 p2 ... pn
        for(int i=0; i<n; i++) {
            cout << p[i] << (i < n-1 ? " " : "\n");
        }

        // Output s1 s2 ... sn
        for(int i=0; i<n; i++) {
            cout << s[i] << (i < n-1 ? " " : "\n");
        }
    }

    return 0;
}
