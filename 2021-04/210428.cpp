#include <vector>

using namespace std;

class Solution {
 public:
  int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {
    if (obstacleGrid[0][0] == 1) {
      return 0;
    }
    int m = obstacleGrid.size();
    int n = obstacleGrid[0].size();
    obstacleGrid[0][0] = 1;
    for (int j = 1; j < m; j++) {
      obstacleGrid[j][0] = obstacleGrid[j][0] ? 0 : obstacleGrid[j - 1][0];
    }
    for (int i = 1; i < n; i++) {
      obstacleGrid[0][i] = obstacleGrid[0][i] ? 0 : obstacleGrid[0][i - 1];
    }
    for (int j = 1; j < m; j++) {
      for (int i = 1; i < n; i++) {
        obstacleGrid[j][i] =
            obstacleGrid[j][i]
                ? 0
                : (obstacleGrid[j - 1][i] + obstacleGrid[j][i - 1]);
      }
    }
    return obstacleGrid[m - 1][n - 1];
  }
};