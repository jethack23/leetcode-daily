;;; hy==1.0a4

(defclass Solution []
  (defn asteroidCollision [self asteroids]
    (setv stack [])
    (for [a asteroids]
      (if (> a 0)
          (stack.append a)
          (do
            ;; destroy left-direction
            (while (and stack (< 0 (get stack -1) (- a)))
              (stack.pop))
            ;; last-step
            (cond [(or (not stack) (< (get stack -1) 0)) (stack.append a)]
                  [(= (get stack -1) (- a)) (stack.pop)]))))
    stack))


;; class Solution:

;;     def asteroidCollision(self, asteroids):
;;         stack = []
;;         for a in asteroids:
;;             if a > 0:
;;                 _hy_anon_var_3 = stack.append(a)
;;             else:
;;                 while stack and 0 < stack[-1] < -a:
;;                     stack.pop()
;;                 _hy_anon_var_3 = stack.append(a) if not stack or stack[-1] < 0 else stack.pop() if stack[-1] == -a else None
;;         return stack
