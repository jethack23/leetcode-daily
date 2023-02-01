(defclass Node []
  (defn __init__ [self [key None] [val None]]
    (setv self.next None
          self.prev None
          self.key key
          self.val val
          self.f 1)
    None))

(defclass BiLinkedList []
  (defn __init__ [self]
    (setv self.alpha-omega (Node)
          self.alpha-omega.prev self.alpha-omega
          self.alpha-omega.next self.alpha-omega
          self.size 0)
    None)

  (defn append [self node]
    (setv node.prev self.alpha-omega.prev
          self.alpha-omega.prev.next node
          self.alpha-omega.prev node
          node.next self.alpha-omega)
    (+= self.size 1))

  (defn pop [self [node None]]
    (setv rst (if node node self.alpha-omega.next)
          rst.prev.next rst.next
          rst.next.prev rst.prev)
    (-= self.size 1)
    rst))

(defclass LFUCache []
  (defn __init__ [self capacity]
    (setv self.freqs (defaultdict BiLinkedList)
          self.cache {}
          self.minf 0
          self.capacity capacity)
    None)

  (defn __getitem__ [self key]
    (setv node (get self.cache key))
    (.pop (get self.freqs node.f) node)
    (when (and (= self.minf node.f) (= (. (get self.freqs node.f) size) 0))
      (+= self.minf 1))
    (+= node.f 1)
    (.append (get self.freqs node.f) node)
    node)

  (defn get [self key]
    (if (in key self.cache)
        (. (get self key) val)
        -1))

  (defn put [self key value]
    (cond
      (in key self.cache)
      (setv (. (get self key) val) value)

      (and (= self.capacity 0) (not self.cache))
      None
      
      True
      (do (if (> self.capacity 0)
              (-= self.capacity 1)
              (.pop self.cache (. (.pop (get self.freqs self.minf)) key)))
          (setv self.minf 1
                node (Node key value)
                (get self.cache key) node)
          (.append (get self.freqs 1) node)))))
