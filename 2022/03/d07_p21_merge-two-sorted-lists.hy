;;; hy==1.0a4

(defclass Solution []
  (defn mergeTwoLists [self list1 list2]
    (if (is list1 None) (return list2))
    (if (is list2 None) (return list1))
    (if (> list1.val list2.val)
        (setv [list1 list2] [list2 list1]))
    (setv rst list1
          cursor list1
          list1 list1.next)
    (while (and list1 list2)
      (if (<= list1.val list2.val)
          (setv cursor.next list1
                cursor cursor.next
                list1 list1.next)
          (setv cursor.next list2
                cursor cursor.next
                list2 list2.next)))
    (if (is list1 None)
        (setv cursor.next list2)
        (setv cursor.next list1))
    rst))
