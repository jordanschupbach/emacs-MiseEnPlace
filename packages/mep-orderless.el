;; https://github.com/oantolin/orderless
(use-package orderless
 :straight (:host github :repo "oantolin/orderless")
  :custom
  (completion-styles '(orderless))      ; Use orderless
  (completion-category-defaults nil)    ; I want to be in control!
  ;; (completion-category-overrides
  ;;  '((file (styles basic-remote ; For `tramp' hostname completion with `vertico'
  ;;                  orderless))))
  )
