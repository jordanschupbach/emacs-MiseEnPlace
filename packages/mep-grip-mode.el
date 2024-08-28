;; https://github.com/seagle0128/grip-mode
(use-package grip-mode
  :straight (:host github :repo "seagle0128/grip-mode")
  :ensure t
  :hook ((markdown-mode org-mode) . grip-mode))
