class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        dic = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

        ret = []
        for d in digits:
            if not ret:
                ret = list(dic[int(d)])
            else:
                mem = []
                for s in ret:
                    for c in dic[int(d)]:
                        mem.append(s + c)
                ret = mem

        return ret
