;; https://github.com/emacsorphanage/git-gutter
(use-package git-gutter
 :straight (:host github :repo "emacsorphanage/git-gutter")
 :config
   ;; If you enable global minor mode
   (global-git-gutter-mode t)

   ;; If you would like to use git-gutter.el and linum-mode
   (git-gutter:linum-setup)
)
