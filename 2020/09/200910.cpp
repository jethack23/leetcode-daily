class Solution {
 public:
  string getHint(string secret, string guess) {
    vector<int> cnt1(10);
    vector<int> cnt2(10);
    int bull = 0, cow = 0;
    for (int i = 0; i < secret.size(); i++) {
      char s = secret[i];
      char g = guess[i];
      if (s == g) {
        bull++;
      } else {
        cnt1[s - '0']++;
        cnt2[g - '0']++;
      }
    }
    for (int i = 0; i < 10; i++) {
      cow += min(cnt1[i], cnt2[i]);
    }
    return to_string(bull) + "A" + to_string(cow) + "B";
  }
};