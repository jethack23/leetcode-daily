class Solution:
    def maxPathSum(self, root):
        return sol(root)


def sol(root):
    return max_path_sum_and_max_onway_sum(root)[0]


def max_path_sum_and_max_onway_sum(root):
    return (
        [-1000, 0]
        if root is None
        else calc_target(
            root.val,
            *max_path_sum_and_max_onway_sum(root.left),
            *max_path_sum_and_max_onway_sum(root.right)
        )
    )


def calc_target(val, lmax, loneway, rmax, roneway):
    return [
        max(lmax, rmax, val + loneway + roneway),
        max(0, val + max(loneway, roneway)),
    ]
