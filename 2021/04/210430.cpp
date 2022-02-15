#include <math.h>

#include <unordered_set>
#include <vector>

using namespace std;

class Solution {
 public:
  vector<int> powerfulIntegers(int x, int y, int bound) {
    unordered_set<int> mem;
    for (int i = 1; i < bound; i *= x) {
      for (int j = 1; j <= bound - i; j *= y) {
        mem.insert(i + j);
        if (y == 1) break;
      }
      if (x == 1) break;
    }
    return vector<int>(mem.begin(), mem.end());
  }
};