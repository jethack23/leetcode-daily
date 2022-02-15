def get_digits(N):
    bag = [0] * 10
    while N:
        bag[N % 10] += 1
        N //= 10
    return bag


class Solution:
    def reorderedPowerOf2(self, N: int) -> bool:
        ndigits = get_digits(N)
        cnt = sum(ndigits)
        n = 1
        bag = [0] * 10
        while sum(bag) <= cnt:
            bag = get_digits(n)
            if ndigits == bag:
                return True
            n *= 2
        return False
