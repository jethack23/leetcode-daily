#include <vector>

using namespace std;

class Solution {
 public:
  int jump(vector<int>& nums) {
    int n = nums.size();
    vector<int> mem(n, 1000);
    mem[n - 1] = 0;
    for (int i = n - 2; i >= 0; --i) {
      for (int j = 1; j <= min(nums[i], n - i - 1); ++j) {
        mem[i] = min(mem[i], mem[i + j] + 1);
      }
    }
    return mem[0];
  }
};