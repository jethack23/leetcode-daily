class Solution:
    def detectCapitalUse(self, word: str) -> bool:
        if len(word) < 2:
            return True
        last_upper = word[-1].isupper()
        if last_upper:
            return word[:-1].isupper()
        else:
            return word[1:].islower()
