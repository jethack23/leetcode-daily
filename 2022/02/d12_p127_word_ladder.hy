;;; hy==1.0a4

(import collections [defaultdict deque])

(defclass Solution []
  (defn ladderLength [self beginWord endWord wordList]
    (setv l (len beginWord)
          found False
          mem (defaultdict list)
          candidates (deque [[beginWord 2]]))
    (defn substitute [w i [l l]]
      (+ (get w (slice 0 i))
         "*"
         (get w (slice (+ i 1) l))))
    (for [w wordList]
      (for [i (range l)]
        (.append (get mem (substitute w i)) w))
      (if (and (not found) (= w endWord))
          (setv found True)))
    (if (not found) (return 0))
    (while candidates
      (setv [word step] (candidates.popleft))
      (for [i (range l)]
        (setv i-sub (substitute word i))
        (for [c (get mem i-sub)]
          (if (= endWord c) (return step))
          (candidates.append [c (+ step 1)]))
        (del (get mem i-sub))))
    0))
