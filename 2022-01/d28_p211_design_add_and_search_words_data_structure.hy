;;; hy==1.0a4

(import collections [defaultdict])

(defclass WordDictionary []
  (defn __init__ [self]
    (setv self.childs (defaultdict (fn [] None)))
    None)
  
  (defn addWord [self word]
    (if word
        (do
          (setv c (get word 0)
                rest-w (get word (slice 1 None)))
          (if (not (get self.childs c))
              (setv (get self.childs c) (WordDictionary)))
          (.addWord (get self.childs c) rest-w))
        (setv (get self.childs 0) True)))

  (defn search [self word]
    (if word
        (do
          (setv c (get word 0)
                rest-w (get word (slice 1 None)))
          (cond [(= c ".")
                 (do (setv rst False)
                     (for [[k v] (self.childs.items)]
                       (when (!= k 0)
                         (setv rst (or rst (.search v rest-w)))))
                     rst)]
                [(in c self.childs)
                 (.search (get self.childs c) rest-w)]
                [True False]))
        (get self.childs 0))))
