;; https://github.com/domtronn/all-the-icons.el
(use-package all-the-icons
  :straight (:host github :repo "domtronn/all-the-icons.el"))

;; https://github.com/iyefrat/all-the-icons-completion
(use-package all-the-icons-completion
  :straight (:host github :repo "iyefrat/all-the-icons-completion")
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))
