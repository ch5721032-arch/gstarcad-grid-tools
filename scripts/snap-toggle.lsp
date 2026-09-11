;; snap-toggle.lsp - Toggle snap and grid together
;; Command: SNAPTOG
(defun c:SNAPTOG ( / on )
  (setq on (if (= (getvar "SNAPMODE") 0) 1 0))
  (setvar "SNAPMODE" on)
  (setvar "GRIDMODE" on)
  (princ (if (= on 1) "\nSnap and grid on." "\nSnap and grid off."))
  (princ)
)
