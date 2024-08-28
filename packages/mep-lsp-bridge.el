;; https://github.com/manateelazycat/lsp-bridge
(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :after yasnippet
  :init
  ;; (global-lsp-bridge-mode)
  ;; (setq lsp-bridge-enable-org-babel t)
  )
