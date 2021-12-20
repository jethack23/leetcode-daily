class Solution:
    def intToRoman(self, num: int) -> str:
        unit_dict = {
            1: "I",
            5: "V",
            10: "X",
            50: "L",
            100: "C",
            500: "D",
            1000: "M",
            5000: "",
            10000: "",
        }

        def roman_rule(n, bigger, half, default):
            default = unit_dict[default]
            half = unit_dict[half]
            bigger = unit_dict[bigger]
            if n >= 9:
                return default + bigger
            elif n >= 5:
                return half + (n - 5) * default
            elif n >= 4:
                return default + half
            else:
                return n * default

        ret = ""
        unit = 1000
        while unit > 0:
            ret += roman_rule(num // unit, unit * 10, unit * 5, unit)
            num %= unit
            unit //= 10

        return ret
