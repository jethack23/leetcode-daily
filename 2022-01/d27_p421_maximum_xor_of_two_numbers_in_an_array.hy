;;; hy==1.0a4

(defclass TRIE []
  (defn __init__ [self [val 0]]
    (setv self.val val
          self.one None
          self.zero None))
  
  (defn add [self stack]
    (when stack
      (setv next-d (stack.pop)
            next-node (cond [(and next-d self.one) self.one]
                            [(and (not next-d) self.zero) self.zero]
                            [True (do (setv new-node (TRIE (+ (* 2 self.val) next-d)))
                                      (if next-d
                                          (setv self.one new-node)
                                          (setv self.zero new-node))
                                      new-node)]))
      (next-node.add stack)
      (stack.append next-d)))

  (defn best-choice [self stack]
    (if (not stack)
        (return self.val))
    (setv next-d (stack.pop)
          rst (if (or (not self.one) (and next-d self.zero))
                  (.best-choice self.zero stack)
                  (.best-choice self.one stack)))
    (stack.append next-d)
    rst))

(defclass Solution []
  (defn findMaximumXOR [self nums]
    (defn num-to-stack [n]
      (setv rst [])
      (while n
        (rst.append (% n 2))
        (//= n 2))
      rst)
    (defn fill-zeros [stacks]
      (setv l (max (lfor s stacks (len s)))
            rst [])
      (for [s stacks]
        (rst.append (+ s (* [0] (- l (len s))))))
      rst)
    (setv stacks (fill-zeros (lfor n nums (num-to-stack n)))
          head (TRIE)
          rst 0)
    (for [s stacks]
      (head.add s))
    (for [[n s] (zip nums stacks)] 
      (setv rst (max rst (^ n (head.best-choice s)))))
    rst))
