;;; hy==1.0a4

(pys "class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next")

(import heapq [heappush heappop])


(defn array-to-list [arr]
  (setv rst None)
  (while arr
    (setv rst (ListNode (arr.pop) rst)))
  rst)

(defclass Solution []
  (defn mergeKLists [self lists]
    (setv mem []
          rst [])
    (for [[i node] (enumerate lists)]
      (when node
        (heappush mem [node.val i])
        (setv (get lists i) node.next)))
    (while mem
      (setv [val i] (heappop mem)
            node (get lists i))
      (rst.append val)
      (when node
        (heappush mem [node.val i])
        (setv (get lists i) node.next)))
    (array-to-list rst)))

;;; helper

(defn list-to-array [lst]
  (setv rst [])
  (while lst
    (rst.append lst.val)
    (setv lst lst.next))
  rst)

(list-to-array (.mergeKLists (Solution) (list (map array-to-list (py "[[1,4,5],[1,3,4],[2,6]]")))))
