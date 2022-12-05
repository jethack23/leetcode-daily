;;; hy==1.0a4

(defn sol [head]
  (setv slow head
        fast head.next)
  (while (not (is None fast))
    (setv slow slow.next)
    (for [_ (range 2)]
      (when (not (is None fast))
        (setv fast fast.next))))
  slow)
