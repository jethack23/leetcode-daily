class Solution:
    def snakesAndLadders(self, board: List[List[int]]) -> int:
        return sol(board)


from collections import deque


def get_coord(x, l):
    q = (x - 1) // l
    col = l - 1 - (x - 1) % l if q % 2 else (x - 1) % l
    return [l - 1 - q, col]


def sol(b):
    l = len(b)
    q = deque([[1, 0]])
    rst = -1
    visited = [False] * (l * l + 1)
    while q:
        [x, s] = q.popleft()
        for i in range(x + 1, x + 7):
            if i == l * l:
                return s + 1
                _hy_anon_var_3 = None
            else:
                if visited[i]:
                    continue
                    _hy_anon_var_2 = None
                else:
                    _hy_anon_var_2 = None
                _hy_anon_var_3 = _hy_anon_var_2
            visited[i] = True
            [x, y] = get_coord(i, l)
            at_board = b[x][y]
            if at_board == -1:
                _hy_anon_var_5 = q.append([i, s + 1])
            else:
                if at_board == l * l:
                    return s + 1
                    _hy_anon_var_4 = None
                else:
                    _hy_anon_var_4 = q.append([at_board, s + 1]) if True else None
                _hy_anon_var_5 = _hy_anon_var_4
    return rst


None
