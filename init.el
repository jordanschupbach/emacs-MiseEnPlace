; MisEnPlace init

;; (byte-recompile-directory "~/.emacs.d" 0 t)

;; TODO: move to mep config

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load "~/.emacs.d/bootstrap-straight.el")
(load "~/.emacs.d/mep-config.el")
(load "~/.private/private.el")
(load "~/.emacs.d/mep-core.el")
(load "~/.emacs.d/packages/init.el")

;; (setq projectile-switch-project-action ‘neotree-projectile-action)
