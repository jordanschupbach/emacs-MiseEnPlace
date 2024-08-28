;; https://github.com/editorconfig/editorconfig-emacs

(use-package editorconfig
  :straight (:host github :repo "editorconfig/editorconfig-emacs")
  :ensure t
  :config
  (editorconfig-mode 1))
