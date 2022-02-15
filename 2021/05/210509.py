class Solution:
    def isPossible(self, target: List[int]) -> bool:
        n = len(target)
        if n == 1:
            return target[0] == 1
        cnt = sum(target)
        target = [-x for x in target]
        heapq.heapify(target)
        while cnt > n:
            lgst = -heapq.heappop(target)
            cnt -= lgst
            if (
                lgst <= cnt
                or cnt < n - 1
                or (smalst := 1 if cnt == 1 else lgst % cnt) < 1
            ):
                return False
            cnt += smalst
            heapq.heappush(target, -smalst)
        return True
