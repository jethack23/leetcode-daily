from typing import List

class Solution:
    def suggestedProducts(self, products: List[str], searchWord: str) -> List[List[str]]:
        products.sort()
        ret = []
        pos = 0
        n = len(products)
        for i in range(1, len(searchWord) + 1):
            q = searchWord[:i]
            res = []
            while pos < n and not products[pos].startswith(q):
                pos += 1
            for j in range(3):
                if pos + j < n and products[pos+j].startswith(q):
                    res.append(products[pos+j])
                else:
                    break
            ret.append(res)
        return ret