(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [defaultdict])


(pys
  "class Solution:
    def maxOutput(self, n: int, edges: List[List[int]], price: List[int]) -> int:
        return sol(n, edges, price)")

(defn sol [n edges price]
  (setv g (get-graph edges)
        to-visit (* [True] n)
        rst 0)
  
  (defn recur [n]
    (nonlocal rst)
    (setv (get to-visit n) False
          p (get price n)
          csreturns (lfor c (get g n) :if (get to-visit c) [c (recur c)])
          max-sorted (sorted (map (fn [x] (setv [c [m mne]] x) [m c]) csreturns))
          mne-sorted (sorted (map (fn [x] (setv [c [m mne]] x) [mne c]) csreturns))
          [fmax fmi] (if max-sorted (max-sorted.pop) [0 -1])
          [fmne fnei] (if mne-sorted (mne-sorted.pop) [(- p) -2])
          rst (max rst (if (!= fmi fnei)
                           (+ p fmax fmne)
                           (do (setv [smax _] (if max-sorted (max-sorted.pop) [0 -1])
                                     [smne _] (if mne-sorted (mne-sorted.pop) [(- p) -2]))
                               (+ p (max (+ fmax smne)
                                         (+ smax fmne)))))))
    [(+ p fmax) (+ p fmne)])
  (recur 0)
  rst)


(defn get-graph [es]
  (setv rst (defaultdict list))
  (for [[a b] es]
    (.append (get rst a) b)
    (.append (get rst b) a))
  rst)



(comment

  (test "n = 6, edges = [[0,1],[1,2],[1,3],[3,4],[3,5]], price = [9,8,7,6,10,5]")
  (test "n = 3, edges = [[0,1],[1,2]], price = [1,1,1]")
  (test "a = 78,
b = [[0,64],[2,69],[4,66],[8,36],[10,6],[11,9],[12,13],[13,21],[14,59],[16,49],[17,7],[18,54],[19,15],[25,49],[26,15],[28,41],[29,51],[31,5],[32,64],[33,21],[35,53],[38,9],[40,44],[43,39],[39,41],[51,34],[52,36],[56,37],[57,30],[59,5],[5,49],[49,74],[60,66],[61,55],[64,50],[50,34],[34,55],[65,7],[7,23],[23,54],[66,42],[69,55],[70,58],[71,53],[53,9],[9,1],[1,27],[27,20],[20,15],[15,44],[44,58],[58,72],[72,36],[36,46],[46,55],[55,22],[73,3],[3,67],[67,76],[74,30],[30,42],[42,68],[68,37],[37,63],[75,54],[76,63],[63,41],[41,54],[54,45],[45,24],[24,21],[21,47],[47,48],[48,22],[22,6],[6,62],[62,77]],
c = [19,540,251,155,703,278,278,442,456,421,270,18,344,383,585,381,152,264,616,215,663,209,32,396,437,206,650,295,661,339,655,153,360,659,295,520,734,82,628,503,637,503,603,262,144,62,656,448,662,596,741,359,100,347,637,640,608,671,314,289,697,225,276,726,43,296,183,582,124,466,404,607,544,315,557,283,446,59]
")
  
  )
