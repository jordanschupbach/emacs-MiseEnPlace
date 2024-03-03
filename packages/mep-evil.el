;; https://github.com/emacs-evil/evil
(use-package evil
 :straight (:host github :repo "emacs-evil/evil")
 :init
 (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
 (setq evil-want-keybinding nil)
 :config
   ;; Enable Evil
   (require 'evil)
   (evil-mode 1))
