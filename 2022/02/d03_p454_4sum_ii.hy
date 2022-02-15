;;; hy==1.0a4

(import collections [defaultdict])

(defclass Solution []
  (defn fourSumCount [self nums1 nums2 nums3 nums4]
    (setv mem (defaultdict int)
          rst 0)
    (for [[i x] (enumerate nums3)]
      (for [[j y] (enumerate nums4)]
        (+= (get mem (+ x y)) 1)))
    (for [[i x] (enumerate nums1)]
      (for [[j y] (enumerate nums2)]
        (+= rst (get mem (- (+ x y))))))
    rst))
