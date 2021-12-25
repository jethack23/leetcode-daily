(import [collections [defaultdict]])

(defclass Solution []
  (defn findOrder [self n prerequisites]
    
    (defn preprocess [prerequisites]
      (setv after-courses (defaultdict list)
            num-prerequisits (* [0] n))
      (for [(, c p) prerequisites]
        (.append (get after-courses p) c)
        (+= (get num-prerequisits c) 1))
      (, after-courses num-prerequisits))

    (defn sol [after-courses num-prerequisits]
      (setv course-order (lfor (, i n) (enumerate num-prerequisits) :if (= n 0) i))

      (setv i 0)
      (while (< i (len course-order))
        (setv c (get course-order i))
        (for [p (get after-courses c)]
          (-= (get num-prerequisits p) 1)
          (if (= (get num-prerequisits p) 0)
              (course-order.append p)))
        (+= i 1))
      
      (if (= (len course-order) n) course-order []))

    (sol #* (preprocess prerequisites))))
