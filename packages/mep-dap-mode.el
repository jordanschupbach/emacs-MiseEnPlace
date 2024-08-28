;; https://github.com/emacs-lsp/dap-mode

(use-package dap-mode
 :straight (:host github :repo "emacs-lsp/dap-mode")
 :config
    (dap-mode 1)
    (setq dap-auto-configure-features '(sessions locals controls tooltip))
    (require 'dap-codelldb)
)
