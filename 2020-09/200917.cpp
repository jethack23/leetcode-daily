class Solution {
 public:
  void turn_left(pair<int, int>& dir) { dir = {-dir.second, dir.first}; }
  void turn_right(pair<int, int>& dir) { dir = {dir.second, -dir.first}; }
  bool isRobotBounded(string instructions) {
    pair<int, int> pos{0, 0};
    pair<int, int> dir{0, 1};
    for (auto i : instructions) {
      if (i == 'L')
        turn_left(dir);
      else if (i == 'R')
        turn_right(dir);
      else {
        pos.first += dir.first;
        pos.second += dir.second;
      }
    }
    return (pos.first == 0 && pos.second == 0) || dir.second != 1;
  }
};