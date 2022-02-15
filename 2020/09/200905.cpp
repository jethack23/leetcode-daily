class Solution {
 public:
  void dfs(TreeNode* node, vector<int>& mem) {
    if (node == nullptr) return;
    dfs(node->left, mem);
    mem.push_back(node->val);
    dfs(node->right, mem);
  }
  vector<int> getAllElements(TreeNode* root1, TreeNode* root2) {
    vector<int> mem1, mem2, ret;
    dfs(root1, mem1);
    dfs(root2, mem2);
    int j = 0;
    for (int i = 0; i < mem1.size(); i++) {
      while (j < mem2.size() && mem1[i] >= mem2[j]) {
        ret.push_back(mem2[j]);
        j++;
      }
      ret.push_back(mem1[i]);
    }
    while (j < mem2.size()) {
      ret.push_back(mem2[j]);
      j++;
    }
    return ret;
  }
};