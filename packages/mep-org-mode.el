;;; packages/org.el -*- lexical-binding: t; -*-

;; TODO: investigate org-macs ????
;; https://github.com/emacs-straight/org-mode
(use-package org
 :straight (:host github :repo "emacs-straight/org-mode")
   :config
(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    ;; (emacs-lisp . nil)
    ;; (mermaid . t)
    (shell . t)
    (python . t)
    (scheme . t)
    (julia . t)
    (coq . t)
    (C . t)
    ;; (R . t)
    (ipython . t)
    )
    (load-library "ob-R")
    (load-library "ob-C")

  )
)

;; (setq org-startup-with-latex-preview t)
;; (setq org-startup-with-inline-images t)
;; 
;; 
;; ;; (setq org-display-remote-inline-images t)
;; ;; https://blog.tecosaur.com/tmio/2021-04-26-Welcome.html#inline-display-remote
;; ;; on 2022-09-04 this only works for tramp remote links and not for http / https
;; (setq org-display-remote-inline-images 'cache)
;; 
;; ;; ;; we look to doom emacs for an example how to get remote images also working
;; ;; ;; for normal http / https links
;; ;; ;; 1. image data handler
;; ;; (defun org-http-image-data-fn (protocol link _description)
;; ;;   "Interpret LINK as an URL to an image file."
;; ;;   (when (and (image-type-from-file-name link)
;; ;;              (not (eq org-display-remote-inline-images 'skip)))
;; ;;     (if-let (buf (url-retrieve-synchronously (concat protocol ":" link)))
;; ;;         (with-current-buffer buf
;; ;;           (goto-char (point-min))
;; ;;           (re-search-forward "\r?\n\r?\n" nil t)
;; ;;           (buffer-substring-no-properties (point) (point-max)))
;; ;;       (message "Download of image \"%s\" failed" link)
;; ;;       nil)))
;; ;;
;; ;; ;; 2. add this as link parameter for http and https
;; ;; (org-link-set-parameters "http"  :image-data-fun #'org-http-image-data-fn)
;; ;; (org-link-set-parameters "https" :image-data-fun #'org-http-image-data-fn)
;; 
;; )
;; 
;; ;; 3. pull in org-yt which will advise ~org-display-inline-images~ how to do the extra handling
;; (use-package! org-yt)
;; (use-package! ob-go)
;; 
;; 
;; ;; TODO: do these in the above config
;; (after! org (load-library "ob-R"))
;; (after! org (load-library "ob-python"))
;; (after! org (load-library "ob-C"))
;; (after! org (load-library "ob-clojure"))
;; (after! org (load-library "ob-go"))
;; ;; (after! org (load-library "ob-coq"))
;; (after! org (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))
;; 
;; (use-package! org-ref)
;; 
;; (after! org-ref
;; (setq org-ref-default-bibliography '("~/org/ref/references.bib")))
;; 
;; (after! org-ref
;; (setq org-completion-bibliography '("~/org/ref/references.bib")))
;; 
;; (after! org-ref
;; (setq bibtex-completion-bibliography '("~/org/ref/references.bib")
;; 	bibtex-completion-library-path '("~/Dropbox/emacs/bibliography/bibtex-pdfs/")
;; 	bibtex-completion-notes-path "~/Dropbox/emacs/bibliography/notes/"
;; 	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"
;; 
;; 	bibtex-completion-additional-search-fields '(keywords)
;; 	bibtex-completion-display-formats
;; 	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
;; 	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
;; 	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;; 	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;; 	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
;; 	bibtex-completion-pdf-open-function
;; 	(lambda (fpath)
;; 	  (call-process "open" nil 0 nil fpath))))
;; 
;; 
;; 
;; 
;; ;; (after!
;; ;; (setq org-ref-bibliography-notes '("~/org/ref/references.bib")
;; ;;       org-ref-default-bibliography '("~/org/ref/references.bib")
;; ;;       org-ref-pdf-directory '("~/org/ref/references.bib")))
;; 
;; 
;; 
;; 
;; (after! org
;; (setq org-startup-with-latex-preview t)
;; (setq org-startup-with-inline-images t)
;;   )
;; 
;; ;; (use-package! org-bullets
;; ;;   :config
;; ;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; ;;   )
;; 
;; ;; TODO: diagnose what's going wrong with polymode...
;; ;; maybe need configs?
;; (use-package! polymode
;;   :config
;;   )




;; (use-package! poly-R
;;   :after polymode
;;   :config
;;   )
;;
;; (use-package! poly-markdown
;;   :after polymode
;;   :config
;;   )
;;
;; (use-package! poly-org
;;   :after polymode
;;   :config
;;   )
