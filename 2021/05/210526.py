class Solution:
    def minPartitions(self, n: str) -> int:
        ret = 0
        for i in n:
            ret = max(ret, int(i))
        return ret
