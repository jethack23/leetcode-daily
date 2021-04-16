from typing import List


class Solution:
    def constructArray(self, n: int, k: int) -> List[int]:
        m = (k + 1) - (k + 1) // 2
        first = list(range(1, m + 1))
        second = list(range(m + 1, k + 2))[::-1]
        remain = list(range(k + 2, n + 1))
        return [
            first[i // 2] if i % 2 == 0 else second[i // 2] for i in range(k + 1)
        ] + remain
