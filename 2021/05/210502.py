from typing import List
import heapq


class MaxHeap:
    def __init__(self):
        self.heap = []

    def push(self, item):
        heapq.heappush(self.heap, -item)

    def pop(self):
        return -heapq.heappop(self.heap)

    def top(self):
        return -self.heap[0]

    def __len__(self):
        return len(self.heap)


class Solution:
    def scheduleCourse(self, courses: List[List[int]]) -> int:
        courses.sort(key=lambda x: (x[1], x[0]))
        heap = MaxHeap()
        current_total = 0
        for l, d in courses:
            if current_total <= d - l:
                current_total += l
                heap.push(l)
            elif len(heap) and heap.top() > l:
                current_total -= heap.pop()
                heap.push(l)
                current_total += l
        return len(heap)
