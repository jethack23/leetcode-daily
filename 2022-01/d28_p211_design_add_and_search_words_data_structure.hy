;;; hy==1.0a4

(import collections [defaultdict])

(defclass WordDictionary []
  (defn __init__ [self]
    (setv self.childs (defaultdict WordDictionary)
          self.word-ends False)
    None)
  
  (defn addWord [self word]
    (if word
        (.addWord (get self.childs (get word 0))
                  (get word (slice 1 None)))
        (setv self.word-ends True)))

  (defn search [self word]
    (if word
        (do
          (setv c (get word 0)
                rest-w (get word (slice 1 None)))
          (cond [(= c ".")
                 (do (setv rst False)
                     (for [[k v] (self.childs.items)]
                       (setv rst (or rst (.search v rest-w))))
                     rst)]
                [(in c self.childs)
                 (.search (get self.childs c) rest-w)]
                [True False]))
        self.word-ends)))
