from bisect import bisect_left, bisect_right


class MyCalendar:
    def __init__(self):
        self.starts = []
        self.ends = []

    def book(self, s, e):
        s_in_e = bisect_left(self.ends, s)
        e_in_s = bisect_left(self.starts, e)
        n = len(self.ends)
        # add this schedule at last
        if s_in_e == n:
            self.starts.append(s)
            self.ends.append(e)
            return True
        # when this schedule can be placed right after another schedule
        elif self.ends[s_in_e] == s:
            if s_in_e == n - 1 or self.starts[s_in_e + 1] > e:
                self.ends[s_in_e] = e
                return True
            # when three schedules are continuous
            elif self.starts[s_in_e + 1] == e:
                self.ends[s_in_e] = self.ends[s_in_e + 1]
                self.starts.pop(s_in_e + 1)
                self.ends.pop(s_in_e + 1)
                return True
        # when this schedule can be placed right before another schedule
        elif e_in_s < n and self.starts[e_in_s] == e:
            if e_in_s == 0 or self.ends[e_in_s - 1] < s:
                self.starts[e_in_s] = s
                return True
        #  when available and no continuous schedule
        elif s_in_e == e_in_s:
            self.ends.insert(s_in_e, e)
            self.starts.insert(s_in_e, s)
            return True
        return False


# Your MyCalendar object will be instantiated and called as such:
# obj = MyCalendar()
# param_1 = obj.book(start,end)
