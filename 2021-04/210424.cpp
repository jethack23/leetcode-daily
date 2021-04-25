#include <functional>
#include <iostream>
#include <vector>

using namespace std;

class Solution {
 public:
  vector<vector<int>> criticalConnections(int n,
                                          vector<vector<int>>& connections) {
    vector<vector<int>> ret;
    vector<int> visit(n, -1);
    vector<vector<int>> g(n);
    int ind = 0;

    for (auto e : connections) {
      g[e[0]].push_back(e[1]);
      g[e[1]].push_back(e[0]);
    }

    function<int(int, int)> dfs = [&](int v, int p) {
      int low_v = visit[v] = ++ind;
      for (int w : g[v]) {
        if (w == p) {
          continue;
        } else if (visit[w] != -1) {
          low_v = min(low_v, visit[w]);
        } else {
          int low_w = dfs(w, v);
          low_v = min(low_v, low_w);
          if (low_w > visit[v]) {
            ret.push_back({v, w});
          }
        }
      }
      return low_v;
    };

    dfs(0, -1);

    return ret;
  }
};

int main() {
  Solution S;
  int n = 4;
  vector<vector<int>> connections = {{0, 1}, {1, 2}, {2, 0}, {1, 3}};
  S.criticalConnections(n, connections);
}