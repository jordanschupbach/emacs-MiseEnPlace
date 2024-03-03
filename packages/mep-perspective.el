
;; https://github.com/nex3/perspective-el
(use-package perspective
 :straight (:host github :repo "nex3/perspective-el")
  ;; :bind
  ;; ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  ;; :custom
  ;; (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here

 :config
 (defun my/persp-neo ()
   "Make NeoTree follow the perspective"
   (interactive)
   (let ((cw (selected-window))
         (path (buffer-file-name))) ;;save current window/buffer
         (progn
           (when (and (fboundp 'projectile-project-p)
                      (projectile-project-p)
                      (fboundp 'projectile-project-root))
             (neotree-dir (projectile-project-root)))
           (neotree-find path))
    (select-window cw)))
  :hook
  (persp-switch . my/persp-neo)


  :init
  (persp-mode))

;; https://github.com/bbatsov/persp-projectile
(use-package persp-projectile
 :straight (:host github :repo "bbatsov/persp-projectile")
 :after (projectile perspective)
  (persp-mode))
