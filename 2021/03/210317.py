from typing import List
import random


class Solution:
    def __init__(self, radius: float, x_center: float, y_center: float):
        self.r = radius
        self.x_c = x_center
        self.y_c = y_center

    def randPoint(self) -> List[float]:
        x = 1
        y = 1
        while x ** 2 + y ** 2 > 1:
            x = random.random() * 2 - 1
            y = random.random() * 2 - 1

        x *= self.r
        y *= self.r

        return self.x_c + x, self.y_c + y

