#include<deque>

class Solution {
public:
  string removeDuplicates(string s, int k) {
    deque<int> cnt;
    deque<char> chars;
    string ret;

    for (auto c:s) {
      if (cnt.size() == 0 || chars.back() != c) {
        cnt.push_back(1);
        chars.push_back(c);
      }
      else {
        cnt.back() += 1;
      }
      if (cnt.back() == k) {
        cnt.pop_back();
        chars.pop_back();
      }
    }
    while (cnt.size() > 0) {
      int m = cnt.front();
      cnt.pop_front();
      char c = chars.front();
      chars.pop_front();
      for (int i = 0; i < m; i++) {
        ret.push_back(c);
      }
    }
    return ret;
  }
};
