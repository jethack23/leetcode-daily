class Solution {
 public:
  string largestTimeFromDigits(vector<int>& A) {
    int h = -1;
    int m = -1;
    for (int i = 0; i < 4; i++) {
      if (A[i] > 2) continue;
      for (int j = 0; j < 4; j++) {
        if (j == i || A[i] * 10 + A[j] > 23) continue;
        for (int k = 0; k < 4; k++) {
          if (k == j || k == i || A[k] > 5) continue;
          for (int l = 0; l < 4; l++) {
            int nh = A[i] * 10 + A[j];
            int nm = A[k] * 10 + A[l];
            if (l == k || l == j || l == i || nm > 59) continue;
            if (nh < h)
              continue;
            else if (nh > h) {
              h = nh;
              m = nm;
            } else if (nm > m) {
              m = nm;
            }
          }
        }
      }
    }
    if (h != -1 && m != -1) {
      ostringstream out;
      if (h < 10) out << '0';
      out << h << ':';
      if (m < 10) out << '0';
      out << m;
      return out.str();
    }
    return "";
  }
};