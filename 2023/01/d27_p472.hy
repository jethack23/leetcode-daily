(import typing *)
(defmacro comment [#* b])

(defmacro assign [s]
  (setv ns (.split s ", "))
  `(do ~@(lfor a ns `(pys ~a))))

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(pys
  "

class Solution:
    def findAllConcatenatedWordsInADict(self, words: List[str]) -> List[str]:
        return sol(words)


")

(defn alpha2idx [a]
  (- (ord a) (ord "a")))

(defclass Trie []
  (defn __init__ [self]
    (setv self.childs (* [False] 26)
          self.eow False))

  (defn add [self w [i 0]]
    (if (= i (len w))
        (setv self.eow True)
        (do (when (not (get self.childs (alpha2idx (get w i))))
              (setv (get self.childs (alpha2idx (get w i))) (Trie)))
            (.add (get self.childs (alpha2idx (get w i))) w (+ i 1))))))

(defn sol [words]
  (setv t (Trie))
  (for [w words]
    (t.add w))
  (defn recur [s [i 0] [node t] [found 0]]
    (if (= i (len s))
        (and (> found 0) node.eow)
        (or (and node.eow (recur s i t (+ found 1)))
            (and (get node.childs (alpha2idx (get s i)))
                 (recur s (+ i 1) (get node.childs (alpha2idx (get s i))) found)))))
  (list (filter (fn [x] (recur x)) words)))

(comment
  
  (test "words = [\"cat\",\"cats\",\"catsdogcats\",\"dog\",\"dogcatsdog\",\"hippopotamuses\",\"rat\",\"ratcatdogcat\"]")
  
  )
