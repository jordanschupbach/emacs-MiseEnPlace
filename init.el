; MisEnPlace init

;; (byte-recompile-directory "~/.emacs.d" 0 t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load "~/.emacs.misenplace/bootstrap-straight.el")
(load "~/.emacs.misenplace/packages/mep-doom-themes.el")
(load "~/.emacs.misenplace/mep-util.el")
(load "~/.emacs.misenplace/mep-config.el")
(load "~/.emacs.misenplace/language-configs/init.el")
(load "~/.emacs.misenplace/mep-core.el")
(load "~/.emacs.misenplace/packages/init.el")
(load "~/.emacs.misenplace/mep-post-package-config.el")
(load "~/.private/private.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" 'doom-one 'doom-one-light default))
 '(safe-local-variable-values
   '((org-gtd-directory . "~/.emacs.misenplace/gtd")
     (org-gtd-directory . ~/.emacs.misenplace/gtd)))
 '(texfrag-scale 3.0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setup-theme) 

(defun project-switch-project (dir)
  "\"Switch\" to another project by running an Emacs command.
The available commands are presented as a dispatch menu
made from `project-switch-commands'.

When called in a program, it will use the project corresponding
to directory DIR."
  (interactive (list (funcall project-prompter)))
  (project--remember-dir dir)
  (delete-other-windows)
  (find-file (concat dir "/README.org"))
  (split-window-below)
  (evil-window-down 1)
  (term "/bin/bash")
  (term-send-raw-string "\C-l")
  (neotree)
  (evil-window-right 1)
  ;; (evil-window-up 1)
  (window-resize (selected-window) 6))



(dap-register-debug-template
  "C++ LLDB Run Configuration"
  (list :type "lldb"
        :request "launch"
        :name "C++ Debug"
        :program "/home/jordan/Downloads/codelldb/extension/adapter/codelldb"
        :args '("--port" "1200")
        :externalConsole t
        :target nil))

;; (load-theme 'doom-one)

(global-hl-line-mode 1)

;; /home/jordan/.emacs.misenplace/.extension/vscode/codelldb/extension/adapter/codelldb --port 37929
;; /bin/bash: line 1: /home/jordan/.emacs.misenplace/.extension/vscode/codelldb/extension/adapter/codelldb: No such file or directory

;; (load "preview-latex.el" nil t t)
;; (require 'auctex-latexmk)
;; (auctex-latexmk-setup)


;; (setq org-preview-latex-default-process 'dvisvgm)
;; (setq latex-run-command "xelatex")
;; (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))


;; (golden-ratio-mode)
;; (defun my-buffer-switch-hook ()
;;   (golden-ratio))

;; (add-hook 'buffer-list-update-hook 'my-buffer-switch-hook)

;; (setq org-confirm-babel-evaluate nil)
