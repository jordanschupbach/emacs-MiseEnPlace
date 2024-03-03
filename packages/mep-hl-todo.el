;; https://github.com/tarsius/hl-todo

(use-package hl-todo
:straight (:host github :repo "tarsius/hl-todo")
 :config 
   (setq hl-todo-keyword-faces
         '(("TODO"   . "#FF0000")
           ("FIXME"  . "#FF0000")
           ("DEBUG"  . "#A020F0")
           ("GOTCHA" . "#FF4500")
           ("STUB"   . "#1E90FF")))
   (global-hl-todo-mode)

)
