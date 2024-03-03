;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
 :straight (:host github :repo "seagle0128/doom-modeline")
 :init (doom-modeline-mode 1)
)
;; https://github.com/RyanMillerC/poke-line
(use-package poke-line
 :straight (:host github :repo "RyanMillerC/poke-line")
 :ensure t
 :config
 (poke-line-global-mode 1)
 )
