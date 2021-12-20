/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */

class Solution {
 public:
  int recur(TreeNode *node, bool is_left) {
    if (!node)
      return 0;
    else if (!(node->left) && !(node->right)) {
      return (is_left) ? node->val : 0;
    } else {
      return recur(node->left, true) + recur(node->right, false);
    }
  }
  int sumOfLeftLeaves(TreeNode *root) { return recur(root, false); }
};
