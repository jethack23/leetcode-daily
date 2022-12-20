class Solution:
    def canVisitAllRooms(self, rooms):
        return sol(rooms)


def sol(rooms):
    n = len(rooms)
    tovisit = set(range(n))

    def recur(i):
        tovisit.remove(i)
        for k in rooms[i]:
            recur(k) if k in tovisit else None

    recur(0)
    return not tovisit
