;; https://github.com/company-mode/company-mode

(use-package company
 :straight (:host github :repo "company-mode/company-mode")
  :config
    (add-hook 'shell-mode-hook 'company-mode)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 0)

    (setq company-transformers '(company-sort-by-occurrence))
    (add-to-list 'company-backends 'company-clang)
    (add-to-list 'company-backends 'company-elisp)
    (company-quickhelp-mode 1)


    ;;(add-to-list 'auto-mode-alist '("\\.h\\'" . company-mode))
    ;;(add-to-list 'auto-mode-alist '("\\.hpp\\'" . company-mode))
    ;;(add-to-list 'auto-mode-alist '("\\.cpp\\'" . company-mode))
  )
