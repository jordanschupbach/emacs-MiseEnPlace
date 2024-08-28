

;; Set projectile switch project hook
  (defun set-gtd-dir-local ()
  (when (projectile-project-p)
    (setq org-gtd-directory (concat (projectile-project-root) "gtd"))
    ;; (message "Setting gtd root: %s" (concat (projectile-project-root) "gtd")))
    ))
  (add-hook 'projectile-after-switch-project-hook #'set-gtd-dir-local)
  
