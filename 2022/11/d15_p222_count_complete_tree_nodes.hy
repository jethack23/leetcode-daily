;;; hy==1.0a4

(defn left-depth [node [rst 0]]
  (if (not (is None node.left))
      (left-depth node.left (+ rst 1))
      rst))
(defn right-depth [node [rst 0]]
  (if (not (is None node.right))
      (right-depth node.right (+ rst 1))
      rst))
(defn find-biggest [l r root]
  (while (< l r)
    (setv mid (- r (// (- r l) 2)))
    (if (leaf? mid root)
        (setv l mid)
        (setv r (- mid 1))))
  l)
(defn leaf? [mid root]
  (setv s [])
  (while mid
    (s.append (% mid 2))
    (//= mid 2))
  (s.pop)
  (while s
    (if (s.pop)
        (if (is root.right None)
            (return False)
            (setv root root.right))
        (if (is root.left None)
            (return False)
            (setv root root.left))))
  True)

(defclass Solution []
  (defn countNodes [self root]
    (if (is root None) (return 0))
    (setv ld (left-depth root)
          rd (right-depth root))
    (if (= ld rd)
        (- (** 2 (+ ld 1)) 1)
        (find-biggest (** 2 ld) (** 2 (+ ld 1)) root))))
