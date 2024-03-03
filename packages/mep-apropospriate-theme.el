
;; https://github.com/waymondo/apropospriate-theme
;; NOTE: there doesn't seem to have this be able to load..
(use-package apropospriate-theme
 :straight (:host github :repo "waymondo/apropospriate-theme")
  :ensure t
  :config 
  (load-theme 'apropospriate-dark t)
  ;; or
  ;; (load-theme 'apropospriate-light t)
  (add-hook 'after-init-hook (lambda () (load-theme 'apropospriate-dark t)))
  )
;; (require 'apropospriate)
;; (load-theme 'apropospriate-dark t)
;; (message "Hello world!")
