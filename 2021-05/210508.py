def is_palindrome(s):
    s = str(s)
    for i in range(len(s) // 2):
        if s[i] != s[-i - 1]:
            return False
    return True


class Solution:
    def superpalindromesInRange(self, left: str, right: str) -> int:
        left = int(left)
        right = int(right)

        def recur(cur, left, right):
            if cur[0] == "0" or (sq := int(cur) ** 2) < left or sq > right:
                ret = 0
            elif is_palindrome(sq):
                ret = 1
            else:
                ret = 0
            for c in "1234567890":
                next = c + cur + c
                if (int(next) ** 2) > right:
                    return ret
                ret += recur(next, left, right)
            return ret

        ret = 0
        for i in "1234567890":
            ret += recur(i, left, right)
            ret += recur(i + i, left, right)
        return ret
