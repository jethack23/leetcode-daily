from typing import List


class Solution:
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        self.graph = graph
        self.n = len(graph)
        self.mem = [0] * self.n
        return self.dfs(0)

    def dfs(self, node):
        if node == self.n - 1:
            return [[self.n - 1]]

        ret = []
        for c in self.graph[node]:
            path_c = self.dfs(c)
            for p in path_c:
                ret.append([node] + p)
        return ret
