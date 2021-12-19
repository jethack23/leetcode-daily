(defn calc-stack [stack]
  (setv reverse-s ""
        reverse-num "")
  (while (and stack (!= (get stack -1) "["))
    (+= reverse-s (stack.pop)))
  (stack.pop)
  (while (and stack (in (get stack -1) "1234567890"))
    (+= reverse-num (stack.pop)))
  (setv s (get reverse-s (slice None None -1))
        num (int (get reverse-num (slice None None -1))))
  (+ stack (list (* s num))))

(defclass Solution []
  (defn decodeString [self s]
    (setv stack [])
    (for [c s]
      (if (= c "]")
          (setv stack (calc-stack stack))
          (stack.append c)))
    (.join "" stack)))
