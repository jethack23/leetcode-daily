class Solution {
 public:
  vector<int> ver2vec(string& ver) {
    vector<int> vec;
    int num = 0;
    for (auto c : ver) {
      if (c == '.') {
        vec.push_back(num);
        num = 0;
      } else {
        num *= 10;
        num += (int)(c - '0');
      }
    }
    vec.push_back(num);
    return vec;
  }
  int compareVersion(string version1, string version2) {
    vector<int> vec1 = ver2vec(version1);
    vector<int> vec2 = ver2vec(version2);
    int i;
    for (i = 0; i < min(vec1.size(), vec2.size()); i++) {
      if (vec1[i] > vec2[i])
        return 1;
      else if (vec2[i] > vec1[i])
        return -1;
    }
    if (vec1.size() > vec2.size()) {
      for (; i < vec1.size(); i++) {
        if (vec1[i] > 0) return 1;
      }
    } else {
      for (; i < vec2.size(); i++) {
        if (vec2[i] > 0) return -1;
      }
    }
    return 0;
  }
};