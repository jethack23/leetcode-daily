class Solution:
    def averageOfLevels(self, root: TreeNode) -> List[float]:
        level_sum = []
        level_cnt = []

        def dfs(node, depth=0):
            if node is None:
                return
            if len(level_sum) < depth + 1:
                level_sum.append(node.val)
                level_cnt.append(1)
            else:
                level_sum[depth] += node.val
                level_cnt[depth] += 1
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)

        dfs(root)

        return [s / c for (s, c) in zip(level_sum, level_cnt)]
