;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :straight (:host github :repo "emacs-evil/evil-collection")
  :after evil
  :ensure t
  :config
  (evil-collection-init))
