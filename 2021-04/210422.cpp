#include<unordered_map>
#include<vector>

using namespace std;

class Solution {
public:
    int leastBricks(vector<vector<int>>& wall) {
        int n = 0;
        int height = wall.size();
        unordered_map<int, int> mem;
        for (auto row : wall) {
            int cur = 0;
            for (int i = 0; i < row.size() - 1; i++) {
                cur += row[i];
                mem[cur]++;
            }
        }
        int most_boundary = 0;
        for (auto pair : mem) {
            most_boundary = max(most_boundary, pair.second);
        }
        return height - most_boundary;
    }
};