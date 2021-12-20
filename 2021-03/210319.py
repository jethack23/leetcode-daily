class Solution:
    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        queue = [0]
        n = len(rooms)
        opended = [False] * n
        opended[0] = True
        cnt = 1
        while queue and cnt < n:
            this = queue.pop(0)
            for r in rooms[this]:
                if not opended[r]:
                    opended[r] = True
                    cnt += 1
                    queue.append(r)
        return cnt == n

