class Trie {
 public:
  char val;
  vector<char> next_chars;
  vector<Trie> next_nodes;
  bool eow;
  Trie() { eow = false; }
  Trie(char val) : val{val} { eow = false; }
  int find(char c) {
    for (unsigned int i = 0; i < next_chars.size(); i++) {
      if (c == next_chars[i]) return i;
    }
    return -1;
  }
  void add(string& w, unsigned int pos) {
    if (pos < w.length()) {
      char c = w[pos];
      for (unsigned int i = 0; i < next_chars.size(); i++) {
        if (c == next_chars[i]) {
          next_nodes[i].add(w, pos + 1);
          return;
        }
      }
      next_chars.push_back(c);
      next_nodes.push_back(Trie(c));
      next_nodes.back().add(w, pos + 1);
    } else if (pos == w.length()) {
      eow = true;
    }
  }
};

Trie build_trie(vector<string>& words) {
  Trie head;
  for (auto w : words) {
    head.add(w, 0);
  }
  return head;
}

class StreamChecker {
 public:
  vector<Trie*> mem;
  Trie head;
  StreamChecker(vector<string>& words) : mem{} { head = build_trie(words); }

  bool query(char letter) {
    mem.push_back(&head);
    bool found = false;
    for (unsigned int i = 0; i < mem.size(); i++) {
      int pos = mem[i]->find(letter);
      if (pos != -1) {
        mem[i] = &(mem[i]->next_nodes[pos]);
        if (mem[i]->eow) found = true;
      } else {
        mem.erase(mem.begin() + i);
        i--;
      }
    }
    return found;
  }
};
