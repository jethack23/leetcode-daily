(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [defaultdict])

(pys
  "




")


(comment
  
  
  
  )
