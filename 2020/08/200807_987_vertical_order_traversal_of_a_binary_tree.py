class Solution:
    def verticalTraversal(self, root: TreeNode) -> List[List[int]]:
        self.cur = 0
        self.y = 0
        self.rpart = []
        self.lpart = []
        self.dfs(root)
        ret = self.lpart[::-1] + self.rpart
        ret = [
            list(map(lambda x: x[0], sorted(l, key=lambda x: (-x[1], x[0]))))
            for l in ret
        ]
        return ret

    def dfs(self, node):
        if node is None:
            return

        if self.cur >= 0:
            if self.cur + 1 > len(self.rpart):
                self.rpart.append([(node.val, self.y)])
            else:
                self.rpart[self.cur].append((node.val, self.y))
        else:
            if -self.cur > len(self.lpart):
                self.lpart.append([(node.val, self.y)])
            else:
                self.lpart[-self.cur - 1].append((node.val, self.y))

        self.y -= 1
        self.cur -= 1
        self.dfs(node.left)
        self.cur += 2
        self.dfs(node.right)
        self.cur -= 1
        self.y += 1
