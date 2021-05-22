from typing import List


def possible(board, i, j):
    n = len(board)
    for k in range(-i, 0):
        if board[i + k][j] == "Q":
            return False
    for k in range(max(-i, -j), 0):
        if board[i + k][j + k] == "Q":
            return False
    for k in range(max(-i, j - n + 1), 0):
        if board[i + k][j - k] == "Q":
            return False
    return True


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        board = [["."] * n for _ in range(n)]
        ret = []

        def dfs(row=0):
            if row == n:
                ret.append(["".join(row) for row in board])
                return
            for j in range(n):
                if possible(board, row, j):
                    board[row][j] = "Q"
                    dfs(row + 1)
                    board[row][j] = "."

        dfs()
        return ret
