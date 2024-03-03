
;; https://github.com/bbatsov/projectile
(use-package projectile
 :straight (:host github :repo "bbatsov/projectile")
 :config
 (projectile-mode +1)

  (setq projectile-sort-order 'recentf)
  ;; (setq projectile-completion-system 'vertico)
  (defun projectile-test-suffix (project-type) ;; tmi: expand these for more languages (C++,python, etc.)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond
     ((member project-type '(rails-rspec ruby-rspec)) "_spec")
     ((member project-type '(rails-test ruby-test lein-test go)) "_test")
     ((member project-type '(r)) "_test")
     ((member project-type '(scons)) "test")
     ((member project-type '(maven symfony)) "Test")
     ((member project-type '(gradle grails)) "Spec")))

 )
