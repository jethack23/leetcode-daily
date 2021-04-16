# """
# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
# """
# class NestedInteger:
#    def isInteger(self) -> bool:
#        """
#        @return True if this NestedInteger holds a single integer, rather than a nested list.
#        """
#
#    def getInteger(self) -> int:
#        """
#        @return the single integer that this NestedInteger holds, if it holds a single integer
#        Return None if this NestedInteger holds a nested list
#        """
#
#    def getList(self) -> [NestedInteger]:
#        """
#        @return the nested list that this NestedInteger holds, if it holds a nested list
#        Return None if this NestedInteger holds a single integer
#        """


class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.lstack = [nestedList]
        self.istack = [0]

    def next(self) -> int:
        ret = self.lstack[-1][self.istack[-1]]
        self.istack[-1] += 1
        return ret.getInteger()

    def hasNext(self) -> bool:
        if len(self.istack) == 0:
            return False
        elif len(self.lstack[-1]) == self.istack[-1]:
            self.lstack.pop()
            self.istack.pop()
        else:
            val = self.lstack[-1][self.istack[-1]]
            if val.isInteger():
                return True
            else:
                self.lstack.append(val.getList())
                self.istack[-1] += 1
                self.istack.append(0)
        return self.hasNext()


# Your NestedIterator object will be instantiated and called as such:
# i, v = NestedIterator(nestedList), []
# while i.hasNext(): v.append(i.next())
