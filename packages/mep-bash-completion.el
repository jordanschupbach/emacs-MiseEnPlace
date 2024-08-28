
;; https://github.com/szermatt/emacs-bash-completion
(use-package bash-completion
 :straight (:host github :repo "szermatt/emacs-bash-completion")
  :config
    (bash-completion-setup)

(add-hook 'eshell-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions
                      'bash-completion-capf-nonexclusive nil t)))
	)

