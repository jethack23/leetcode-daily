class Solution:
    def findDuplicates(self, nums: List[int]) -> List[int]:
        mem = [0] * len(nums)
        ret = []

        for n in nums:
            mem[n - 1] += 1

        for i in range(len(mem)):
            if mem[i] == 2:
                ret.append(i + 1)
        return ret
