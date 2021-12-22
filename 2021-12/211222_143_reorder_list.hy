(defn split-into-head-tail [nodes]
  (setv n (len nodes)
        split (+ (// n 2) (% n 2))
        head (get nodes (slice None split))
        tail (get nodes (slice (- n 1) (- split 1) -1)))
  (.append (if (% n 2) tail head) None)
  (, head tail))

(defn merge-head-tail [head tail]
  (lfor i (range (+ (len head) (len tail)))
        (if (% i 2) (get tail (// i 2)) (get head (// i 2)))))

(defn stitch [nodes]
  (for [(, l r) (zip (get nodes (slice None -1))
                     (get nodes (slice 1 None)))]
    (setv l.next r))
  (get nodes 0))

(defclass Solution []
  (defn reorderList [self head]
    (setv  nodes [])
    (while head
      (nodes.append head)
      (setv head head.next))
    (stitch (merge-head-tail #* (split-into-head-tail nodes)))))
