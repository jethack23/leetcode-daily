class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        l = len(tasks)
        cnt = {}
        for t in tasks:
            try:
                cnt[t] += 1
            except:
                cnt[t] = 1
        max_cnt = 0
        max_cnt_tasks = 0
        for value in cnt.values():
            if max_cnt == value:
                max_cnt_tasks += 1
            elif max_cnt < value:
                max_cnt_tasks = 1
                max_cnt = value

        if max_cnt < 2:
            return l

        others = l - max_cnt - max_cnt_tasks + 1

        required_room = others // (max_cnt - 1)
        if others % (max_cnt - 1):
            required_room += 1

        if required_room <= n:
            print(n, max_cnt, max_cnt_tasks)
            return max_cnt + (max_cnt_tasks - 1) + (max_cnt - 1) * n
        else:
            return l
