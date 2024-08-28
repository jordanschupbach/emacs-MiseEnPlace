;; ;; Remove menubar
;; (menu-bar-mode -1)
;; ;; Remove toolbar
;; (tool-bar-mode -1)
;; '(setq image-mode-map (make-sparse-keymap))
;; '(setq pdf-view-mode-map (make-sparse-keymap))
;; '(setq treemacs-mode-map (make-sparse-keymap))
;; '(progn (define-key image-mode-map (kbd ",") nil))
;; '(progn (define-key pdf-view-mode-map (kbd ",") nil))
;; '(progn (define-key pdf-view-mode-map (kbd "<normal-state> ,") nil))
;; '(progn (define-key image-mode-map (kbd "<normal-state> ,") nil))


;; Setup treesitter
(setq treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
    (cmake "https://github.com/uyha/tree-sitter-cmake")
    (css "https://github.com/tree-sitter/tree-sitter-css")
    (elisp "https://github.com/Wilfred/tree-sitter-elisp")
    (go "https://github.com/tree-sitter/tree-sitter-go")
    (html "https://github.com/tree-sitter/tree-sitter-html")
    (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    (json "https://github.com/tree-sitter/tree-sitter-json")
    (make "https://github.com/alemuller/tree-sitter-make")
    (markdown "https://github.com/ikatyang/tree-sitter-markdown")
    (python "https://github.com/tree-sitter/tree-sitter-python")
    (toml "https://github.com/tree-sitter/tree-sitter-toml")
    (R "https://github.com/r-lib/tree-sitter-r")
    (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
    (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
    (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; I use for output when running shell commands
(generate-new-buffer "*std-err*")

;; Setup Programming minor modes
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; (add-hook 'prog-mode-hook 'flyspell-mode) ;; this is annoying to have on by default.
(setq make-backup-files nil)
(add-hook 'help-mode-hook 'disable-display-line-numbers-mode-hook)

;; Font size
(set-face-attribute 'default nil :height 170) 

;; Remove top Menu
(menu-bar-mode -1)

;; Remove top toolbar
(tool-bar-mode -1)  

;; Remove scrollbar
(scroll-bar-mode -1) 

;; Display line/column numbers
(display-line-numbers-mode)
(column-number-mode t)

;; Include dividers
(menu-bar-bottom-and-right-window-divider)
(window-divider-mode)

;; reverts any buffer associated with a file when the file changes on disk
(global-auto-revert-mode t)

;; Backup settings
(setq require-final-newline nil)
(setq backup-directory-alist `(("." . "~/.emacs.misenplace/.saves"))) 
;; (setq auto-save-file-name-transforms `((".*" "~/.emacs.misenplace/auto-saves/" t)))
(setq tab-bar-select-tab-modifiers "meta")
(setq standard-indent 2)


;; Tramp config
(setq tramp-default-method "ssh")
