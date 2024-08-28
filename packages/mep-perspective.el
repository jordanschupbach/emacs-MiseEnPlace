
;; https://github.com/nex3/perspective-el
;; (use-package perspective
;;  :straight (:host github :repo "nex3/perspective-el")
;;  :config
;;  (defun mep/persp-neo ()
;;    "Make NeoTree follow the perspective"
;;    (interactive)
;;    (let ((cw (selected-window))
;;          (path (buffer-file-name))) ;;save current window/buffer
;;          (progn
;;            (when (and (fboundp 'projectile-project-p)
;;                       (projectile-project-p)
;;                       (fboundp 'projectile-project-root))
;;              (neotree-dir (projectile-project-root)))
;;            (neotree-find path))
;;     (select-window cw)))
;;   :hook
;;   (persp-switch . mep/persp-neo)
;; 
;; 
;;   :init
;;   (persp-mode))
;; 
;; ;; https://github.com/bbatsov/persp-projectile
;; (use-package persp-projectile
;;  :straight (:host github :repo "bbatsov/persp-projectile"))

;; (persp-mode)
;; (require 'persp-projectile)
