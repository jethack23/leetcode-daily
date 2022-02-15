class Solution:
    def numFactoredBinaryTrees(self, arr: List[int]) -> int:
        arr.sort()
        n = len(arr)
        mem = [1] * n
        for i in range(n):
            root = arr[i]
            for j in range(i):
                div = arr[j]
                if div * div > root:
                    break
                if root % div == 0 and root // div in arr:
                    k = arr.index(root // div)
                    mem[i] += mem[j] * mem[k] * (1 if j == k else 2)
        return sum(mem) % (10 ** 9 + 7)
