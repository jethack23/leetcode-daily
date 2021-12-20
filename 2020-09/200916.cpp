class Node {
 public:
  vector<Node*> child;
  Node() : child{nullptr, nullptr} {}
};

class Solution {
 public:
  void insertNode(int val, Node* root) {
    Node* cur = root;
    for (int i = 31; i >= 0; i--) {
      int bit = (val >> i) & 1;
      if (!cur->child[bit]) {
        cur->child[bit] = new Node();
      }
      cur = cur->child[bit];
    }
  }
  int maxXOR(int val, Node* root) {
    Node* cur = root;
    int ret = 0;
    for (int i = 31; i >= 0; i--) {
      int bit = (val >> i) & 1;
      if (cur->child[!bit]) {
        ret |= (1 << i);
        cur = cur->child[!bit];
      } else {
        cur = cur->child[bit];
      }
    }
    return ret;
  }
  int findMaximumXOR(vector<int>& nums) {
    int ret = 0;
    Node* root = new Node();
    for (auto n : nums) {
      insertNode(n, root);
    }
    for (auto n : nums) {
      ret = max(ret, maxXOR(n, root));
    }
    return ret;
  }
};