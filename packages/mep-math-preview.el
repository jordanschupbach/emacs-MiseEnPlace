
;; https://gitlab.com/matsievskiysv/math-preview

(use-package matsievskiysv/math-preview
  :custom (math-preview-command "/path/to/math-preview"))


;; https://github.com/jrblevin/markdown-mode
(use-package math-preview
 :straight (:host github :repo "matsievskiysv/math-preview" )
 :config
    (setq neo-window-fixed-size nil))
