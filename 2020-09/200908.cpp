class Solution {
 public:
  void dfs(TreeNode* node, int& ret, int& num) {
    if (!node) {
      return;
    }
    num *= 2;
    num += node->val;
    if (!node->left && !node->right) ret += num;
    if (node->left) dfs(node->left, ret, num);
    if (node->right) dfs(node->right, ret, num);
    num /= 2;
  }
  int sumRootToLeaf(TreeNode* root) {
    int ret = 0;
    int num = 0;
    dfs(root, ret, num);
    return ret;
  }
};