class Solution:
    def toGoatLatin(self, S: str) -> str:
        def convert(w):
            if w[0] in "aeiouAEIOU":
                return w
            else:
                return w[1:] + w[0]

        return " ".join([convert(w) + "maa" + "a" * i for i, w in enumerate(S.split())])
