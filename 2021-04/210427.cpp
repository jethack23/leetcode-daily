class Solution {
 public:
  bool isPowerOfThree(int n) {
    while (n > 1 && n % 3 == 0) {
      n /= 3;
    }
    return n == 1;
  }
};

/* no loop-recursion version */
class Solution {
 public:
  bool isPowerOfThree(int n) { return (n > 0) && (1162261467 % n == 0); }
};