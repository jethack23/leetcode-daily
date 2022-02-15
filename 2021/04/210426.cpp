#include <queue>
#include <vector>

using namespace std;

class Solution {
 public:
  int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
    priority_queue<int> bricked;
    priority_queue<int, vector<int>, greater<int>> laddered;
    bricked.push(0);
    int n = heights.size();
    int ret = 0;
    int diff;
    for (int i = 0; i < n - 1; i++) {
      diff = heights[i + 1] - heights[i];
      if (diff <= 0) {
      } else if (ladders) {
        ladders--;
        laddered.push(diff);
      } else if (laddered.size() && diff > laddered.top() &&
                 laddered.top() < bricks) {
        bricks -= laddered.top();
        laddered.pop();
        laddered.push(diff);
      } else if (diff < bricks) {
        bricks -= diff;
      } else {
        break;
      }
      ret++;
    }
    return ret;
  }
};