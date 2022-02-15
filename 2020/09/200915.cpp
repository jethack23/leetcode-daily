class Solution {
public:
    int lengthOfLastWord(string s) {
        while (s.size() > 0 && s.back() == ' ') s.pop_back();
        int l = 0;
        bool found = false;
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == ' ') found = false;
            if (s[i] != ' ' && !found) {l = i; found=true;}
        }
        return s.size() - l;
    }
};