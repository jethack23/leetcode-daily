def arithmetic_series(first, numbers, d):
    return (2 * first + (numbers - 1) * d) * numbers // 2


def one_to_n(n):
    return (1 + n) * n // 2


def find_steps(candies):
    i = 1
    while one_to_n(i) <= candies:
        i += 1
    return i - 1


def get(i, q, r):
    return q + (i < r)


def distribution(candies, n):
    s = find_steps(candies)
    q, r = s // n, s % n
    remained_candies = candies - one_to_n(s)
    ret = [arithmetic_series(i + 1, get(i, q, r), n) for i in range(n)]
    ret[r] += remained_candies
    return ret


class Solution:
    def distributeCandies(self, candies: int, num_people: int) -> List[int]:
        return distribution(candies, num_people)
