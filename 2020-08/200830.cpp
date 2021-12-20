class Solution {
 public:
  Solution() {}
  int find(int x, vector<int>& parent) {
    if (parent[x] == -1)
      return x;
    else
      return parent[x] = find(parent[x], parent);
  }
  void uni(int x, int y, vector<int>& parent) {
    int xp = find(x, parent);
    int yp = find(y, parent);
    if (xp != yp) parent[yp] = xp;
  }
  int largestComponentSize(vector<int>& A) {
    vector<int> parent(*max_element(A.begin(), A.end())+1, -1);
    int ret = 0;
    unordered_map<int, int> mem;
    for (int n : A) {
      for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) {
          uni(i, n, parent);
          uni(n, n / i, parent);
        }
    }
    for (int n : A) ret = max(ret, ++mem[find(n, parent)]);
    return ret;
  }
};
