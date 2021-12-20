class Solution {
public:
    vector<string> str2vec(string str) {
        string buffer;
        vector<string> vec;
        for (auto c: str) {
            if (c == ' ') {
                vec.push_back(buffer);
                buffer = "";
            }
            else {
                buffer.push_back(c);
            }
        }
        vec.push_back(buffer);
        return vec;
    }
    bool wordPattern(string pattern, string str) {
        vector<string> vec = str2vec(str);
        vector<string> mem(26, "");
        if (vec.size() != pattern.size()) return false;
        for (int i = 0; i < pattern.size(); i++) {
            if (mem[pattern[i] - 'a'] != "" && mem[pattern[i] - 'a'] != vec[i]) return false;
            else if (mem[pattern[i] - 'a'] == "") {
                mem[pattern[i] - 'a'] = vec[i];
            }
        }
        for (int i = 0; i < 25; i++) {
            if (mem[i] == "") continue;
            for (int j = i+1; j < 26; j++) {
                if (mem[j] == "") continue;
                else if (mem[i] == mem[j]) return false;
            }
        }
        return true;
    }
};