class UndergroundSystem:
    def __init__(self):
        self.idinfo = {}
        self.stainfo = {}

    def checkIn(self, id: int, stationName: str, t: int) -> None:
        self.idinfo[id] = (stationName, t)

    def checkOut(self, id: int, stationName: str, t: int) -> None:
        insta, intime = self.idinfo[id]
        if not insta in self.stainfo:
            self.stainfo[insta] = [[stationName, t - intime, 1]]
        else:
            thisinfo = self.stainfo[insta]
            for i in range(len(thisinfo)):
                if thisinfo[i][0] == stationName:
                    thisinfo[i][2] += 1
                    cnt = thisinfo[i][2]
                    thisinfo[i][1] = (
                        thisinfo[i][1] * (cnt - 1) / cnt + (t - intime) / cnt
                    )
                    self.stainfo[insta] = thisinfo
                    break
            self.stainfo[insta].append([stationName, t - intime, 1])

    def getAverageTime(self, startStation: str, endStation: str) -> float:
        for info in self.stainfo[startStation]:
            if info[0] == endStation:
                return info[1]


# Your UndergroundSystem object will be instantiated and called as such:
# obj = UndergroundSystem()
# obj.checkIn(id,stationName,t)
# obj.checkOut(id,stationName,t)
# param_3 = obj.getAverageTime(startStation,endStation)
