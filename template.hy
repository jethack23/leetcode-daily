(import typing *)
(defmacro comment [#* b])

(defmacro assign [s]
  (setv ns (.split s ", "))
  `(do ~@(lfor a ns `(pys ~a))))

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(pys
  "




")


(comment
  
  
  
  )
