class Solution:
    def isNumber(self, s: str) -> bool:
        digits = "0123456789"

        def is_decimal(s):
            if not "." in s:
                return False
            if s[0] in "+-":
                s = s[1:]
            splitted = s.split(".")
            if len(splitted) != 2:
                return False
            left, right = splitted
            if len(left) == 0 and len(right) == 0:
                return False
            for c in left + right:
                if not c in digits:
                    return False
            return True

        def is_integer(s):
            if len(s) == 0:
                return False
            if s[0] in "+-":
                s = s[1:]
            if len(s) == 0:
                return False
            for c in s:
                if not c in digits:
                    return False
            return True

        e = None

        if "e" in s:
            e = "e"
        elif "E" in s:
            e = "E"

        if e:
            splitted = s.split(e)
            if len(splitted) != 2:
                return False
            left, right = splitted
            return (is_decimal(left) or is_integer(left)) and is_integer(right)
        else:
            return is_decimal(s) or is_integer(s)
