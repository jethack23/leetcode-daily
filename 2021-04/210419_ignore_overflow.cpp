/*
don't know why this can avoid overflow-error.
since answer must fit in int-32, ignoring overflow is valid strategy.
(not gonna be counted finally)
 */

#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

class Solution {
public:
    int combinationSum4(vector<int>& nums, int target) {
        vector<int> mem(target + 1, 0);
        mem[0] = 1;
        for (int n = 1; n <= target; n++) {
            for (auto j : nums) {
                if (j <= n) {
                    mem[n] += (long) mem[n-j];
                }
            }
        }
        return mem[target];
    }
};