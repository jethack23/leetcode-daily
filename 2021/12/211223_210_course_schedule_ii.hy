(defclass Solution []
  (defn findOrder [self n prerequisites]
    (setv self.cycle False)
    
    (defn preprocess [n prerequisites]
      (setv ret (lfor i (range n) [])
            required (* [0] n))
      (for [(, c p) prerequisites]
        (.append (get ret c) p)
        (setv (get required p) 1))
      (, ret (sfor (, c r) (enumerate required) :if (not r) c)))

    (defn dfs [c prerequisites course-order course-taken this-route]
      (cond [self.cycle (return)]
            [(in c this-route) (do (setv self.cycle True)
                                   (return))]
            [(in c course-taken) (return)])
      (this-route.add c)
      (for [p (get prerequisites c)]
        (dfs p prerequisites course-order course-taken this-route))
      (this-route.remove c)
      (course-order.append c)
      (course-taken.add c))
    
    (defn sol [prerequisites roots]
      (setv course-order []
            course-taken (set))
      (for [r roots]
        (dfs r prerequisites course-order course-taken (set)))
      (if (or self.cycle (< (len course-order) n)) [] course-order))

    (sol #* (preprocess n prerequisites))))
