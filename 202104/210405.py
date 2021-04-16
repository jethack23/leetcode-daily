from typing import List


class Solution:
    def isIdealPermutation(self, a: List[int]) -> bool:
        for i, v in enumerate(a):
            if abs(v - i) > 1:
                return False
        return True
