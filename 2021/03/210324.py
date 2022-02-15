class Solution:
    def advantageCount(self, A: List[int], B: List[int]) -> List[int]:
        n = len(A)
        A.sort(reverse=True)
        B = sorted(enumerate(B), key=lambda x: x[1])

        res = [0] * n
        tmp = []
        for i in range(n):
            j, b = B[i]
            while A and A[-1] <= b:
                tmp.append(A.pop())
            if A:
                res[j] = A.pop()
            else:
                res[j] = tmp.pop()
        return res
