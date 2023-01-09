class Solution:
    def inorderTraversal(self, root):
        return iter_sol2(root)


def recur_sol(root):
    """trivial recursive solution"""
    rst = []

    def recur(node):
        if not node is None:
            recur(node.left)
            rst.append(node.val)
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
                st.append([cur.left, "left"])
                last_op = "push"
                _hy_anon_var_4 = None
            else:
                if last_op == "left":
                    rst.append(cur.val)
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


def iter_sol2(root):
    """follow up: iterative solution
    second approach"""

    def closure_op(node):
        return lambda: rst.append(node.val)

    rst = []
    st = [[root, None]]
    while st:
        [cur, f] = st.pop()
        if f is None:
            if not cur is None:
                st.append([cur.right, None])
                st.append([None, closure_op(cur)])
                _hy_anon_var_6 = st.append([cur.left, None])
            else:
                _hy_anon_var_6 = None
            _hy_anon_var_7 = _hy_anon_var_6
        else:
            _hy_anon_var_7 = f()
    return rst
