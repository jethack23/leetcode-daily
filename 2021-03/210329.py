class Solution:
    def flipMatchVoyage(self, root, voyage):
        def dfs(node, rst=[], i=0):
            if node.val == voyage[i]:
                i += 1
                _hy_anon_var_28 = None
            else:
                return [None, 0]
                _hy_anon_var_28 = None
            if node.left and node.right and node.right.val == voyage[i]:
                rst.append(node.val)
                [node.left, node.right] = [node.right, node.left]
                _hy_anon_var_29 = None
            else:
                _hy_anon_var_29 = None
            if node.left:
                [lrst, i] = dfs(node.left, i=i)
                if lrst is None:
                    return [None, 0]
                    _hy_anon_var_30 = None
                else:
                    _hy_anon_var_30 = None
                _hy_anon_var_31 = _hy_anon_var_30
            else:
                _hy_anon_var_31 = None
            if node.right:
                [rrst, i] = dfs(node.right, i=i)
                if rrst is None:
                    return [None, 0]
                    _hy_anon_var_32 = None
                else:
                    _hy_anon_var_32 = None
                _hy_anon_var_33 = _hy_anon_var_32
            else:
                _hy_anon_var_33 = None
            return [rst, i]

        [rst, i] = dfs(root)
        return rst if rst is not None else [-1]
