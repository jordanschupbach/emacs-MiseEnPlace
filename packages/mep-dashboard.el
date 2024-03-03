;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :straight (:host github :repo "emacs-dashboard/emacs-dashboard" :tag "1.8.0")
  :config
  (dashboard-setup-startup-hook)
  ;; (setq dashboard-items '((recents  . 5)
  ;; 			  (projects . 5)
  ;; 			  ;; (bookmarks . 5)
  ;; 			  ;; (agenda . 5)
  ;; 			  ;;(registers . 5)
  ;; 			  ))
  ;; (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/.emacs.d/_assets/mise_en_place.png")
  ;; ;; (add-to-list 'dashboard-items '(agenda) t)
  ;; (setq dashboard-week-agenda t)
  ;; (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  ;; (setq dashboard-projects-switch-function 'projectile-persp-switch-project)
  ;; (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  ;; ;; Match just one TODO keyword.
  ;; ;; (setq dashboard-match-agenda-entry "NEXT=\"NEXT\"")
  ;; (setq dashboard-match-agenda-entry "TODO=\"NEXT\"")
  ;; ;; ;; Match multiple keywords.
  ;; ;; (setq dashboard-match-agenda-entry
  ;; ;; "TODO=\"TODO\"|TODO=\"IN-PROGRESS\"")
  ;; ;;
  ;; ;; ;; Match everything except WAITING.
  ;; ;; (setq dashboard-match-agenda-entry
  ;; ;; "-TODO=\"WAITING\"")
  ;; (setq dashboard-projects-show-base t)
  )
