class Solution:
    def longestValidParentheses(self, s: str) -> int:
        n = len(s)
        stack = [-1]
        ret = 0
        for i in range(n):
            p = s[i]
            if p == "(":
                stack.append(i)
            elif p == ")":
                stack.pop()
                if stack:
                    ret = max(ret, i - stack[-1])
                else:
                    stack.append(i)
        return ret