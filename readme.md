- [Emacs - MisEnPlace](#orgc6f8978)


<a id="orgc6f8978"></a>

# Emacs - MisEnPlace

```elisp
(defun my-get-project-root ()
  (when buffer-file-name
    (let ((root (locate-dominating-file buffer-file-name "project.el")))
      (if root
          (expand-file-name root)
        nil))))

(my-get-project-root)
```
