class NumMatrix:
    def __init__(self, M):
        for i in range(len(M)):
            for j in range(len(M[0])):
                M[i][j] += (M[i - 1][j] if i > 0 else 0) + (M[i][j - 1] if j > 0 else 0)
        self.M = M

    def sumRegion(self, y1, x1, y2, x2):
        return (
            self.M[y2][x2]
            - (self.M[y1 - 1][x2] if y1 > 0 else 0)
            - (self.M[y2][x1 - 1] if x1 > 0 else 0)
            + (self.M[y1 - 1][x1 - 1] if (y1 > 0 and x1 > 0) else 0)
        )
