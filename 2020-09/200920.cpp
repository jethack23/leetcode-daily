class Solution {
 public:
  int dfs(vector<vector<int>>& grid, int l, int y, int x) {
    if (y < 0 || y >= grid.size() || x < 0 || x >= grid[0].size() ||
        grid[y][x] < 0)
      return 0;
    if (grid[y][x] == 2 && l == 0) {
      return 1;
    }
    int save;
    grid[y][x] -= 5;
    int ret = 0;
    // go north
    ret += dfs(grid, l - 1, y - 1, x);
    // go east
    ret += dfs(grid, l - 1, y, x + 1);
    // go west
    ret += dfs(grid, l - 1, y, x - 1);
    // go south
    ret += dfs(grid, l - 1, y + 1, x);
    grid[y][x] += 5;
    return ret;
  }
  pair<int, int> find_start(vector<vector<int>>& grid) {
    for (int j = 0; j < grid.size(); j++) {
      for (int i = 0; i < grid[0].size(); i++) {
        if (grid[j][i] == 1) return pair<int, int>({j, i});
      }
    }
    return pair<int, int>({0, 0});
  }
  int uniquePathsIII(vector<vector<int>>& grid) {
    int m = grid.size();
    int n = grid[0].size();
    int l = m * n;
    for (int i = 0; i < grid.size(); i++)
      for (int j = 0; j < grid[0].size(); j++)
        if (grid[i][j] < 0) l--;
    pair<int, int> pt = find_start(grid);
    return dfs(grid, l - 1, pt.first, pt.second);
  }
};