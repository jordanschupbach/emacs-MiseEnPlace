;; https://github.com/flycheck/flycheck

(use-package flycheck
 :straight (:host github :repo "flycheck/flycheck" :tag "33.0")
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
    (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
	(vector #b00000000
		#b00000000
		#b00000000
		#b00000000
		#b00000000
		#b00111000
		#b01111100
		#b11111110
		#b11111110
		#b01111100
		#b00111000
		#b00000000
		#b00000000
		#b00000000
		#b00000000
		#b00000000
		#b00000000))

(flycheck-define-error-level 'error
  :severity 100
  :compilation-level 2
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'flycheck-fringe-bitmap-ball
  :fringe-face 'flycheck-fringe-error
  :error-list-face 'flycheck-error-list-error)
  )

(setq-default flycheck-disabled-checkers '(proselint))
;; ;; https://github.com/flycheck/flycheck-eglot
;; (use-package flycheck-eglot
;;   :straight (:host github :repo "flycheck/flycheck-eglot")
;;   :after (flycheck eglot)
;;   :ensure t
;;   :config
;;   (global-flycheck-eglot-mode 1))
