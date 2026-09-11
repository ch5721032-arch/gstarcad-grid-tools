;; grid-setup.lsp - Set grid and snap spacing in one command
;; Command: GRIDSET
(defun c:GRIDSET ( / s g )
  (setq s (getdist "\nSnap spacing <10>: "))
  (if (null s) (setq s 10.0))
  (setq g (getdist "\nGrid spacing <50>: "))
  (if (null g) (setq g 50.0))
  (setvar "SNAPUNIT" (list s s))
  (setvar "GRIDUNIT" (list g g))
  (setvar "SNAPMODE" 1)
  (setvar "GRIDMODE" 1)
  (princ "\nGrid and snap updated.")
  (princ)
)
