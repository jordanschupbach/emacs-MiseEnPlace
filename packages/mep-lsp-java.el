;; https://github.com/emacs-lsp/lsp-java
(use-package lsp-java
  :after lsp-mode
  :straight (:host github :repo "emacs-lsp/lsp-java")
  :config (add-hook 'java-mode-hook 'lsp)
)
