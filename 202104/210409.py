from typing import List


class Solution:
    def isAlienSorted(self, words: List[str], order: str) -> bool:
        def bigger(a, b, orderd):
            for c, d in zip(a, b):
                if orderd[c] > orderd[d]:
                    return True
                elif orderd[c] < orderd[d]:
                    return False
            return len(a) > len(b)

        orderd = {}
        for i, c in enumerate(order):
            orderd[c] = i
        for i in range(len(words) - 1):
            if bigger(words[i], words[i + 1], orderd):
                return False
        return True
