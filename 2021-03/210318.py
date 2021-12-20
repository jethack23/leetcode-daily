from typing import List


class Solution:
    def wiggleMaxLength(self, nums: List[int]) -> int:
        n = len(nums)
        if n < 2:
            return n

        ret = 1
        last = nums.pop(0)
        direction = None

        for i in nums:
            if direction is None:
                if i == last:
                    continue
                ret += 1
                direction = (i - last) // abs(i - last)
            elif (i - last) * direction < 0:
                ret += 1
                direction *= -1
            last = i
        return ret
