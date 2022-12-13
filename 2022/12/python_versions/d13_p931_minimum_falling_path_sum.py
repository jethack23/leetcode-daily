class Solution:
    def minFallingPathSum(self, mat):
        return sol(mat)


Mval = 100


def sol(mat):
    n = len(mat)
    for i in range(1, n):
        for j in range(n):
            mat[i][j] += min_previous_path_sum(mat[i - 1], j, n)
    return min(mat[-1])


def min_previous_path_sum(row, j, n):
    return min(row[slice(max(0, j - 1), min(n, j + 2))])
