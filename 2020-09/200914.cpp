class Solution {
public:
    int rob(vector<int>& nums) {
        int a = 0;
        int b = 0;
        int temp = 0;
        for (auto n : nums) {
            temp = max(a + n, b);
            a = b;
            b = temp;
        }
        return b;
    }
};