class Solution:
    def isPowerOfFour(self, num: int) -> bool:
        return (num == 1) or (
            (num > 0)
            and (bin(num)[2] == "1")
            and (len(bin(num)) % 2)
            and (int(bin(num)[3:]) == 0)
        )
