;; https://github.com/arnm/ob-mermaid
(use-package ob-mermaid
 :straight (:host github :repo "arnm/ob-mermaid")
  :after org
  :config
    (add-to-list 'org-babel-load-languages '(mermaid . t))
  )
