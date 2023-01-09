class Solution:
    def preorderTraversal(self, root):
        return iter_sol(root)


def recur_sol(root):
    """trivial recursive solution"""
    rst = []

    def recur(node):
        if not node is None:
            rst.append(node.val)
            recur(node.left)
            _hy_anon_var_1 = recur(node.right)
        else:
            _hy_anon_var_1 = None
        return rst

    return recur(root)


def iter_sol(root):
    """follow up: iterative solution"""
    rst = []
    st = [[root, "right"]]
    last_op = "push"
    while st:
        [cur, lr] = st[-1]
        if cur is None:
            st.pop()
            last_op = lr
            _hy_anon_var_5 = None
        else:
            if last_op == "push":
                rst.append(cur.val)
                st.append([cur.left, "left"])
                last_op = "push"
                _hy_anon_var_4 = None
            else:
                if last_op == "left":
                    st.append([cur.right, "right"])
                    last_op = "push"
                    _hy_anon_var_3 = None
                else:
                    if last_op == "right":
                        st.pop()
                        last_op = lr
                        _hy_anon_var_2 = None
                    else:
                        _hy_anon_var_2 = None
                    _hy_anon_var_3 = _hy_anon_var_2
                _hy_anon_var_4 = _hy_anon_var_3
            _hy_anon_var_5 = _hy_anon_var_4
    return rst
