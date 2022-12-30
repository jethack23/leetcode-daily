class Solution:
    def getOrder(self, ts):
        return sol(ts)


def sol(ts):
    q = order_tasks(ts)
    h = []
    t = 0
    rst = []
    while is_remain(q, h):
        move_tasks_available(q, h, t)
        [i, t] = process_a_task(q, h, t)
        rst.append(i)
    return rst


def is_remain(q, h):
    return q or h


def order_tasks(ts):
    return deque(
        sorted(
            [[p, i, e] for [i, [e, p]] in enumerate(ts)],
            key=lambda x: [x[-1], x[0], x[1]],
        )
    )


def move_tasks_available(q, h, t):
    while q and t >= q[0][-1]:
        heappush(h, q.popleft())
    return [q, h]


def process_a_task(q, h, t):
    [p, i, e] = heappop(h) if h else q.popleft()
    return [i, p + max(t, e)]
