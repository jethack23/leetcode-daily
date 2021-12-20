class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        l = len(flowerbed)
        for i in range(l):
            left = max(0, i - 1)
            right = min(l - 1, i + 1)
            if flowerbed[right] + flowerbed[left] == 0 and flowerbed[i] == 0 and n > 0:
                n -= 1
                flowerbed[i] = 1
        return n == 0
