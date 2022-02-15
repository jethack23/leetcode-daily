#include <vector>
#include <unordered_map>

using namespace std;

class Solution {
public:
    int numSubmatrixSumTarget(vector<vector<int>>& matrix, int target) {
        int m = matrix.size();
        int n = matrix[0].size();
        unordered_map<int, int> mem;
        for (int i = 0; i < m; i++) {
            int row_sum = 0;
            for (int j = 0; j < n; j++) {
                row_sum += matrix[i][j];
                matrix[i][j] = (i ? matrix[i-1][j] : 0) + row_sum;
            }
        }
        int ret = 0;
        for (int i = 0; i < m; i++) {
            for (int k = i; k < m; k++) {
                mem.clear();
                mem[0] = 1;
                for (int j = 0; j < n; j++) {
                    int band_sum = matrix[k][j] - (i ? matrix[i-1][j] : 0);
                    ret += mem.find(band_sum - target) == mem.end() ? 0 : mem[band_sum - target];
                    mem[band_sum]++;
                }
            }
        }
        return ret;
    }
};