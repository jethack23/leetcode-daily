#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

class Solution {
public:
    int combinationSum4(vector<int>& nums, int target) {
        vector<unsigned long long int> mem(target + 1, 0);
        mem[0] = 1;
        for (int n = 1; n <= target; n++) {
            for (auto j : nums) {
                if (j <= n) {
                    mem[n] += mem[n-j];
                }
            }
        }
        return mem[target];
    }
};