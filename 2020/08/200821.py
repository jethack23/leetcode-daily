class Solution:
    def sortArrayByParity(self, A: List[int]) -> List[int]:
        even = []
        odd = []
        for i in A:
            if i % 2:
                odd.append(i)
            else:
                even.append(i)
        return even + odd
