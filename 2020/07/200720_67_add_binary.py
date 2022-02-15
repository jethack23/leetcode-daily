class Solution:
    def addBinary(self, a: str, b: str) -> str:
        ans = ""
        carry = 0
        la = len(a)
        lb = len(b)
        if lb > la:
            a, b = b, a
            la, lb = lb, la
        for i in range(1, lb + 1):
            da = int(a[la - i])
            db = int(b[lb - i])
            s = da + db + carry
            digit = s % 2
            carry = s // 2
            ans += str(digit)
        for j in range(1, la - lb + 1):
            da = int(a[la - lb - j])
            s = da + carry
            digit = s % 2
            carry = s // 2
            ans += str(digit)
        if carry != 0:
            ans += str(carry)
        return ans[::-1]
