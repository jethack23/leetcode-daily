;;; hy==0.25

(require hyrule *)

(import os
        argparse
        collections [deque])

(defn main []
  (setv parser (argparse.ArgumentParser))
  (.add-argument parser "filepath"
                 :help "path to transcompile")
  (setv args (.parse-args parser)
        file-path args.filepath
        new-path (os.path.join "python_versions" (.replace args.filepath ".hy" ".py")))
  (os.makedirs "python_versions" :exist_ok True)
  (os.system f"hy2py {file-path} > {new-path}")
  (with [f (open new-path "r")]
    (setv lines (deque (f.readlines))))
  (with [f (open new-path "w")]
    (while (not (.startswith (get lines 0) "class"))
      (lines.popleft))
    (for [line lines]
      (f.write line)))
  (os.system f"black {new-path}")
  (print "\n\n")
  (os.system f"cat {new-path}")
  (print "\n\n")
  0)

(defmain []
  (main))
