#include "testlib.h"
#include <vector>

int main(int argc, char* argv[]) {
    // Initialize the Testlib environment
    registerTestlibCmd(argc, argv);

    // Define the modulus as per problem statement
    const long long MOD = 998244353;

    // Read the number of test cases
    int t = inf.readInt();
    inf.readEoln(); // Ensure the end of the first line

    // Iterate through each test case
    for(int caseNo = 1; caseNo <= t; caseNo++) {
        // Read the number of Moniforces
        int n = inf.readInt();
        inf.readEoln(); // Ensure the end of the line after reading 'n'

        // Read the current scores p1, p2, ..., pn
        std::vector<long long> p(n);
        for(int i = 0; i < n; i++) {
            p[i] = inf.readLong();
        }
        inf.readEoln(); // Ensure end of line after p's

        // Read the score bonuses s1, s2, ..., sn
        std::vector<long long> s(n);
        for(int i = 0; i < n; i++) {
            s[i] = inf.readLong();
        }
        inf.readEoln(); // Ensure end of line after s's

        // Read contestant's output: n probabilities
        std::vector<long long> contestant_probs(n);
        for(int i = 0; i < n; i++) {
            contestant_probs[i] = ouf.readLong(0, MOD-1, "contestant's probability");
        }
     //   if (caseNo < t)
       //     ouf.readEoln(); // Ensure end of line after contestant's output

        // Read jury's answer: n probabilities
        std::vector<long long> jury_probs(n);
        for(int i = 0; i < n; i++) {
            jury_probs[i] = ans.readLong(0, MOD-1, "jury's probability");
        }
     //   if (caseNo < t)
       //     ans.readEoln(); // Ensure end of line after jury's output

        // Compare each probability
        for(int i = 0; i < n; i++) {
            if(contestant_probs[i] != jury_probs[i]) {
                quitf(_wa, "Test case %d, position %d: expected %lld, found %lld",
                      caseNo, i+1, jury_probs[i], contestant_probs[i]);
            }
        }
    }

    // If all test cases passed
    quitf(_ok, "All test cases passed! Nice job Snow! Maybe you can defeat the Moniforces...");
}
