class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        mem = [1] * (rowIndex + 1)
        for i in range(1, rowIndex):
            for j in range(i, 0, -1):
                mem[j] = mem[j - 1] + mem[j]
        return mem
