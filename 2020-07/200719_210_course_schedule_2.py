from typing import List


class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        n = numCourses
        self.n = n

        # make default storages
        self.course_order = []
        required_by_another = [0] * n
        self.cycle_found = False
        self.visited = [0] * n
        self.visited_this_search = [0] * n
        self.prerequisites = []
        for i in range(n):
            self.prerequisites.append([])

        # save prerequisite informations in storages
        for c, p in prerequisites:
            required_by_another[p] = 1
            self.prerequisites[c].append(p)

        # make order
        for i in range(n):
            if required_by_another[i]:
                continue
            self.dfs(i)
        if len(self.course_order) < n or self.cycle_found:
            return []
        else:
            return self.course_order

    def dfs(self, c: int) -> None:
        if self.visited_this_search[c]:
            self.cycle_found = True
            return
        if self.cycle_found == True or self.visited[c]:
            return
        self.visited[c] = 1
        self.visited_this_search[c] = 1

        for p in self.prerequisites[c]:
            self.dfs(p)

        self.course_order.append(c)
        self.visited_this_search[c] = 0
