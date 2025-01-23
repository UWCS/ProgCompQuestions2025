#include "testlib.h"
#include <vector>
#include <set>
#include <algorithm>
#include <cstdio>

using namespace std;

int main(int argc, char* argv[]) {
    registerValidation(argc, argv);

    // Define constants based on problem constraints
    const int MIN_T = 1;
    const int MAX_T = 20; // Adjust as per problem's maximum number of test cases
    const int MIN_N = 1;
    const int MAX_N = 150;
    const int MIN_VAL = 0;
    const int MAX_VAL = 1000000000;

    // Read the number of test cases
    int T = inf.readInt(MIN_T, MAX_T, "T");
    inf.readEoln(); // Ensure the end of the first line
    int sm = 0;
    for(int testCase = 1; testCase <= T; testCase++) {
        // Read n
        int n = inf.readInt(MIN_N, MAX_N, "n");
        sm += n;
        ensuref(sm <= 150, "Test case %d: Sum of n exceeds 150.", testCase);

        inf.readEoln();

        // Read p1, p2, ..., pn
        vector<int> p(n);
        for(int i = 0; i < n; i++) {
            p[i] = inf.readInt(MIN_VAL, MAX_VAL, "p_i");
            if(i < n -1) inf.readSpace();
            else inf.readEoln();
        }

        // Read s1, s2, ..., sn
        vector<int> s(n);
        for(int i = 0; i < n; i++) {
            s[i] = inf.readInt(MIN_VAL, MAX_VAL, "s_i");
            if(i < n -1) inf.readSpace();
            else inf.readEoln();
        }

    }

    inf.readEof(); // Ensure no extra data is present
}
