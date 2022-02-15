class Solution {
 public:
  int firstMissingPositive(vector<int>& nums) {
    
    int n = nums.size();
    for (int i = 0; i < n; i++) {
      int cur = i;
      while (nums[cur] > 0 && nums[cur] < n && nums[cur] != cur + 1 && nums[cur] != nums[nums[cur] - 1]) {
        int target = nums[cur];
        nums[cur] = nums[target - 1];
        nums[target - 1] = target;
      }
    }
    for (int i = 0; i < n; i++) {
      if (nums[i] != i + 1) return i + 1;
    }
    return n + 1;
  }
};