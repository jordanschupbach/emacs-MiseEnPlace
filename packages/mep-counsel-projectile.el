;; https://github.com/ericdanan/counsel-projectile
(use-package counsel-projectile
 :straight (:host github :repo "ericdanan/counsel-projectile")
 :after counsel projectile
 :config
 (counsel-projectile-mode)
 ;; TODO: Make check for windows - switch to native plus caching
 ;; (setq projectile-indexing-method 'native)
 (setq projectile-indexing-method 'hybrid))
