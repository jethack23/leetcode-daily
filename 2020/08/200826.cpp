class Solution {
 public:
  vector<string> fizzBuzz(int n) {
    vector<string> mem;
    for (int i = 1; i <= n; i++) {
      if (i % 15 == 0)
        mem.push_back("FizzBuzz");
      else if (i % 3 == 0)
        mem.push_back("Fizz");
      else if (i % 5 == 0)
        mem.push_back("Buzz");
      else
        mem.push_back(to_string(i));
    }
    return mem;
  }
};
