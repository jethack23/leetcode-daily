class Solution {
public:
    int maxProfit(vector<int>& prices) {
        if (prices.size() < 1) return 0;
        int top = prices.back();
        long long ret = 0;
        for (int i = prices.size()-1; i >= 0; i--) {
            top = max(top, prices[i]);
            ret = (ret < top - prices[i])? (top-prices[i]) : ret;
        }
        return ret;
    }
};