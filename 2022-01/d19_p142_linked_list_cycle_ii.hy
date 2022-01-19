;;; hy==1.0a4


;;; O(n) memory
(defclass Solution []
  (defn detectCycle [self head]
    (setv mem (set))
    (while (and head (not (in head mem)))
      (mem.add head)
      (setv head head.next))
    head))

;;; O(1) memory
(defmacro do-while [#* body]
  (setv con (get body -1)
        bod (get body (slice None -2)))
  `(do
     ~@bod
     (while ~con
       ~@bod)))

(defclass Solution []
  (defn detectCycle [self head]
    (if (not head) (return None))
    (setv turtle head
          rabbit head)
    (do-while
      (setv rabbit rabbit.next
            turtle turtle.next)
      (if rabbit (setv rabbit rabbit.next))
      :condition
      (and rabbit (!= turtle rabbit)))
    (if (not rabbit)
        None
        (do (while (!= head turtle)
              (setv head head.next
                    turtle turtle.next))
            head))))


;;; helper code for test
(pys "class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None")

(defn build [lst pos]
  (setv node-lst (lfor v lst (ListNode v)))
  (for [i (range (- (len node-lst) 1))]
    (setv (. (get node-lst i) next) (get node-lst (+ i 1))))
  (if (>= pos 0) (setv (. (get node-lst -1) next) (get node-lst pos)))
  (get node-lst 0))


(setv head (build [3 2 0 -4] 1)
      sol (Solution))

(. (.detectCycle sol head) val)
