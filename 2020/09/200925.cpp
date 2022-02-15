class Solution {
 public:
  string largestNumber(vector<int>& nums) {
    auto cmp = [&](int a, int b) {
      int af = 10;
      int bf = 10;
      while (af <= a) af *= 10;
      while (bf <= b) bf *= 10;
      af /= 10;
      bf /= 10;
      if (af == bf) return a > b;
      bool keep = true;
      int l, lf, r, rf;
      if (af < bf) {
        l = a;
        lf = af;
        r = b;
        rf = bf;
      } else {
        l = b;
        lf = bf;
        r = a;
        rf = af;
        keep = false;
      }
      bool ret;
      int l1 = l;
      int r1 = r / (rf / lf);
      int l2 = r / (lf * 10);
      int r2 = r % (rf / lf);
      int l3 = r % (lf * 10);
      int r3 = l;

      if (l1 != r1)
        ret = l1 > r1;
      else if (l2 != r2)
        ret = l2 > r2;
      else
        ret = l3 > r3;
      return (ret == keep);
    };
    sort(nums.begin(), nums.end(), cmp);
    while (nums.size() > 1 && nums.front() == 0 && nums.back() == 0) nums.pop_back();
    string ret = "";
    for (auto num : nums) {
      ret.append(to_string(num));
    }
    return ret;
  }
};