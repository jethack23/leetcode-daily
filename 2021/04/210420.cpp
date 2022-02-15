#include<vector>

using namespace std;

class Node {
public:
    int val;
    vector<Node*> children;

    Node() {}

    Node(int _val) {
        val = _val;
    }

    Node(int _val, vector<Node*> _children) {
        val = _val;
        children = _children;
    }
};

class Solution {
public:
    vector<int> preorder(Node* root) {
        vector<int> mem;
        dfs(root, mem);
        return mem;
    }
    void dfs(Node* node, vector<int>& mem) {
        if (node) {
            mem.push_back(node->val);
            for (auto child : node->children) {
                dfs(child, mem);
            }
        }
    }
};