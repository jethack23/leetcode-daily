class Solution {
 public:
  bool has_key_as_child(TreeNode* node, int key) {
    return (node->left && node->left->val == key) ||
           (node->right && node->right->val == key);
  }
  TreeNode* dfs_find(TreeNode* node, int key) {
    if (node) {
      if (has_key_as_child(node, key)) {
        return node;
      } else {
        TreeNode* lf = dfs_find(node->left, key);
        TreeNode* rf = dfs_find(node->right, key);
        return (lf) ? lf : rf;
      }
    } else
      return nullptr;
  }
  void fix(TreeNode* node, int key) {
    bool target_is_left = node->left && node->left->val == key;
    TreeNode* target = (target_is_left) ? node->left : node->right;
    if (target->left) {
      if (target->left->right) {
        TreeNode* cursor = target->left;
        while (cursor->right->right) cursor = cursor->right;
        target->val = cursor->right->val;
        cursor->right = cursor->right->left;
      } else {
        target->left->right = target->right;
        if (target_is_left) {
          node->left = target->left;
        } else {
          node->right = target->left;
        }
      }
    } else {
      if (target_is_left)
        node->left = target->right;
      else
        node->right = target->right;
    }
  }
  TreeNode* deleteNode(TreeNode* root, int key) {
    TreeNode rp = TreeNode(-1, root, nullptr);
    TreeNode* found = dfs_find(&rp, key);
    if (found) fix(found, key);
    return rp.left;
  }
};
