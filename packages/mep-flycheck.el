;; https://github.com/flycheck/flycheck

(use-package flycheck
 :straight (:host github :repo "flycheck/flycheck" :tag "33.0")
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; ;; https://github.com/flycheck/flycheck-eglot
;; (use-package flycheck-eglot
;;   :straight (:host github :repo "flycheck/flycheck-eglot")
;;   :after (flycheck eglot)
;;   :ensure t
;;   :config
;;   (global-flycheck-eglot-mode 1))
