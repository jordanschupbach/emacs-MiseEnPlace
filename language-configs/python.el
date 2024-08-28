
;; (setq python-shell-interpreter "ipython")
;; (setq python-shell-interpreter-args "--simple-prompt -i")


;; ;; TODO: move to packages?
;; (use-package lsp-pyls
;;     :ensure t
;;     :commands lsp-python-enable
;;     :hook (python-mode . lsp-python-enable)
;;     :config
;;     (defun org-babel-edit-prep:python (babel-info)
;;       "Prepare the local buffer environment for Org source block."
;;       (let ((lsp-file (or (->> babel-info caddr (alist-get :file))
;;                       buffer-file-name)))
;;         (setq-local buffer-file-name lsp-file)
;;         (setq-local lsp-buffer-uri (lsp--path-to-uri buffer-file-name))
;;         (lsp-python-enable)))
;; 
;;     ;; FIXME: https://github.com/emacs-lsp/lsp-python/issues/28
;;     (lsp-define-stdio-client lsp-python "python"
;;                              (lsp-make-traverser #'(lambda (dir)
;;                                                      (if lsp-python-use-init-for-project-root
;;                                                          (not (directory-files dir nil "__init__.py"))
;;                                                        (directory-files
;;                                                         dir
;;                                                         nil
;;                                                         "setup.py\\|Pipfile\\|setup.cfg\\|tox.ini"))))
;;                              nil
;;                              :command-fn 'lsp-python--ls-command))
;; 
