class Solution {
 public:
  vector<int> majorityElement(vector<int>& nums) {
    vector<int> ret;
    int x = 0;
    int y = 1;
    int cntx = 0;
    int cnty = 0;
    for (auto n : nums) {
      if (n == x)
        cntx++;
      else if (n == y)
        cnty++;
      else if (cntx == 0) {
        x = n;
        cntx++;
      } else if (cnty == 0) {
        y = n;
        cnty++;
      } else {
        cntx--;
        cnty--;
      }
    }
    cntx = 0;
    cnty = 0;
    for (auto n : nums) {
      if (n == x)
        cntx++;
      else if (n == y)
        cnty++;
    }
    if (cntx > nums.size() / 3) ret.push_back(x);
    if (cnty > nums.size() / 3) ret.push_back(y);
    return ret;
  }
};