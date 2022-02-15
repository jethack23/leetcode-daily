class Solution {
 public:
  int get_answer(vector<int>& mem) {
    if (mem.size() == 1) return mem[0];
    int ret = 1;
    for (auto n : mem) ret *= n;
    if (ret > 0)
      return ret;
    else {
      int ln = 1;
      for (int i = 0; i < mem.size() && ln > 0; i++) ln *= mem[i];
      int rn = 1;
      for (int i = mem.size() - 1; rn > 0 && i >= 0; i--) rn *= mem[i];
      return max(ret / ln, ret / rn);
    }
  }
  int maxProduct(vector<int>& nums) {
    if (nums.size() == 0) return 0;
    vector<int> mem(0);
    int ret = nums[0];
    for (auto n : nums) {
      if (n == 0) {
        ret = max(0, ret);
        if (mem.size() == 0) continue;
        ret = max(ret, get_answer(mem));
        mem = {};
      } else if (n < 0) {
        mem.push_back(n);
      } else {
        if (mem.size() == 0 || mem.back() < 0) mem.push_back(1);
        mem.back() *= n;
      }
    }
    if (mem.size() > 0) ret = max(ret, get_answer(mem));
    return ret;
  }
};