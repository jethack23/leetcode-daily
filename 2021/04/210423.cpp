#include<string>

using namespace std;

class Solution {
public:
    int countBinarySubstrings(string s) {
        int n = s.size();
        int ret = 0;
        for (int i = 1; i < n; i++) {
            char lc = s[i-1];
            char rc = s[i];
            if (lc == rc) {
                continue;
            }
            ret += 1;
            for (int j = 1; j < n; j++) {
                int l = i - j - 1;
                int r = i + j;
                if (l < 0 || r >= n) {
                    break;
                }
                else if (s[l] == lc && s[r] == rc) {
                    ret += 1;
                }
                else {
                    break;
                }
            }
        }
        return ret;
    }
};