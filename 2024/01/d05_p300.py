def solution(nums):
    rst = []
    for n in nums:
        for [i, l] in enumerate(rst):
            if n < l and (i == 0 or rst[i - 1] < n):
                rst[i] = n
        if not rst or rst[-1] < n:
            rst.append(n)
    return len(rst)


class Solution:
    def lengthOfLIS(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [[[10, 9, 2, 5, 3, 7, 101, 18]]]))


# translated from below s-expression

# ;;; version: 0.1.9
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                ~(ife examples
#                      `(list (map (lambda [x] (print (solution *x)))
#                                  [~@examples]))
#                      None))))
#
# (def solution [nums]
#   (= rst [])
#   (for n nums
#     (for [i l] (enumerate rst)
#       (if (and (< n l)
#                (or (== i 0)
#                    (< (sub rst (- i 1)) n)))
#           (= (sub rst i) n)))
#     (if (or (not rst) (< (sub rst -1) n))
#         (rst.append n)))
#   (return (len rst)))
#
# (leetcode lengthOfLIS
#           [[10 9 2 5 3 7 101 18]])
