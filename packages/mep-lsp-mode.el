

;; https://github.com/emacs-lsp/lsp-mode/
(use-package lsp-mode
  ;; :straight t
  :straight (:host github :repo "emacs-lsp/lsp-mode")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  ;; :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;; (setq lsp-keymap-prefix "C-c l")
  ;; :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
  ;;        (java-mode . lsp)
  ;;        (kotlin-mode . lsp)
  ;;        (python-mode . lsp)
  ;;        (ess-r-mode . lsp)
  ;;        ;; if you want which-key integration
  ;;        ;; (lsp-mode . lsp-enable-which-key-integration)
  ;; 	 ;; (setq lsp-enable-symbol-highlighting nil)
  ;; 	 ;; (setq lsp-ui-doc-enable nil)
  ;; 	 ;; (setq lsp-ui-doc-show-with-cursor nil)
  ;; 	 ;; (setq lsp-ui-doc-show-with-mouse nil)
  ;; 	 ;; (setq lsp-lens-enable nil)
  ;; 	 ;; (setq lsp-ui-sideline-show-hover nil)
  ;; 	 ;; (setq lsp-ui-sideline-enable nil)
  ;; 	 ;; (setq lsp-modeline-code-actions-enable nil)
  ;; 	 ;; (setq lsp-diagnostics-provider :none)
  ;; 	 ;; (setq lsp-ui-sideline-enable nil)
  ;; 	 ;; (setq lsp-ui-sideline-show-diagnostics nil)
  ;; 	 ;; (setq lsp-eldoc-enable-hover nil)
  ;; 	 )
  :commands lsp)





(defun lsp--sort-completions (completions)
  (lsp-completion--sort-completions completions))

(defun lsp--annotate (item)
  (lsp-completion--annotate item))

(defun lsp--resolve-completion (item)
  (lsp-completion--resolve item))

;; https://github.com/tigersoldier/company-lsp
(use-package company-lsp
  ;; :straight t
  :after (company lsp-mode)
  :straight (:host github :repo "tigersoldier/company-lsp")
  :config
(push 'company-lsp company-backends)
)





;; https://github.com/emacs-lsp/lsp-ui

(use-package lsp-ui
  :straight (:host github :repo "emacs-lsp/lsp-ui")
  :commands lsp-ui-mode)

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; 
;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; 
;; ;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))
