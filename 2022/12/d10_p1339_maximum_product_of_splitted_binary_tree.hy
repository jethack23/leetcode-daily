;;; hy==0.25

(defclass Solution []
  (defn maxProduct [self root]
    (% (sol2 root) 1000000007)))

(defn sol [r]
  "first approach - straight forward to problem description, two recursive travels"
  (get (max-product-at-point r (total-sum r)) 0))

(defn total-sum [r]
  (if (is r None)
      0
      (+ r.val
         (total-sum r.left)
         (total-sum r.right))))

(defn max-product-at-point [r total]
  (if (is r None)
      [0 0]
      (calc-target r.val total
                   #* (max-product-at-point r.left total)
                   #* (max-product-at-point r.right total))))

(defn calc-target [val total lmax lsum rmax rsum]
  (setv this-sum (+ val lsum rsum))
  [(max (* this-sum
           (- total this-sum))
        lmax
        rmax)
   this-sum])

(defn sol2 [r]
  "second approach - more efficient with single recursive travel"
  (setv mem [])
  (max-product mem (total-sum-and-record r mem)))

(defn max-product [sums total]
  (max (map (fn [x] (* x (- total x))) sums)))

(defn total-sum-and-record [r mem]
  (if (is r None)
      0
      (append-and-return (+ r.val
                            (total-sum-and-record r.left mem)
                            (total-sum-and-record r.right mem))
                         mem)))

(defn append-and-return [val mem]
  (mem.append val)
  val)
