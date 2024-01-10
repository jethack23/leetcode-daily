def solution(root, start):
    def dfs(node):
        if node is None:
            return [0, 0, 0]
        [lmax, lfound, lto_org] = dfs(node.left)
        [rmax, rfound, rto_org] = dfs(node.right)
        if rfound:
            [[lmax, lfound, lto_org], [rmax, rfound, rto_org]] = [
                [rmax, rfound, rto_org],
                [lmax, lfound, lto_org],
            ]
        return (
            [max(lmax, lto_org + rmax), lfound, lto_org + 1]
            if lfound
            else [max(lmax, rmax), 1, 1]
            if node.val == start
            else [1 + max(lmax, rmax), 0, 0]
        )

    return dfs(root)[0]


class Solution:
    def amountOfTime(self, *args, **kwargs):
        return solution(*args, **kwargs)
