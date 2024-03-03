;; https://github.com/joaotavora/yasnippet

(use-package yasnippet
 :straight (:host github :repo "joaotavora/yasnippet")
 (yas-global-mode 1)
  (add-hook 'org-mode-hook #'yas-minor-mode)
 )

