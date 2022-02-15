from typing import List


def reciprocals(mat):
    n = len(mat)
    for i in range(n):
        for j in range(i+1, n):
            if mat[i][j] != -1 and mat[j][i] == -1:
                mat[j][i] = 1 / mat[i][j]
            if mat[j][i] != -1 and mat[i][j] == -1:
                mat[i][j] = 1 / mat[j][i]

def propagate(mat):
    n = len(mat)
    changed = True
    while changed:
        changed = False
        for i in range(n):
            for j in range(n):
                if i == j: continue
                if mat[i][j] != -1: continue
                for k in range(n):
                    if mat[i][k] != -1 and mat[k][j] != -1:
                        mat[i][j] = mat[i][k] * mat[k][j]
                        changed=True
                        break

class Solution:
    def calcEquation(
        self, equations: List[List[str]], values: List[float], queries: List[List[str]]
    ) -> List[float]:
        keys = set()
        for eq in equations:
            for key in eq:
                keys.add(key)
        l = len(keys)
        idx = {}
        i = 0
        for k in keys:
            idx[k] = i
            i += 1
        mat = [[-1 for _ in range(l)] for _ in range(l)]
        for i in range(l):
            mat[i][i] = 1
        for i in range(len(equations)):
            eq = equations[i]
            v = values[i]
            mat[idx[eq[0]]][idx[eq[1]]] = v
        reciprocals(mat)
        propagate(mat)
        ret = []
        for q in queries:
            try:
                ret.append(mat[idx[q[0]]][idx[q[1]]])
            except:
                ret.append(-1)
        return ret