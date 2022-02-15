from typing import List


class Solution:
    def singleNumber(self, nums: List[int]) -> List[int]:
        mem = 0
        for n in nums:
            mem ^= n
        mbin = self.binstr(mem)
        lmem = len(mbin)

        ret1 = 0
        for n in nums:
            binary_string = self.binstr(n)
            if self.matching(binary_string, lmem):
                ret1 ^= n

        ret2 = 0
        for n in nums:
            ret2 ^= n
        ret2 ^= ret1
        return [ret1, ret2]

    def matching(self, binary_string, lmem):
        l = len(binary_string)
        if l < lmem:
            return False
        return binary_string[lmem - 1] == "1"

    def binstr(self, n):
        if n >= 0:
            return "0" + bin(n)[2:][::-1]
        else:
            return "1" + bin(n)[3:][::-1]
