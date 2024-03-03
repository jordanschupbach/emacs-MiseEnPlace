;;; mep-core.el -*- lexical-binding: t; -*-


(defun mep/clean-sync (dir)
  "Compile all .el files in the specified directory recursively, removing elc files first."
  (interactive "DSelect directory: ")
  (dolist (file (directory-files-recursively dir "\\.el\\'"))
    (when (file-exists-p file)
      (delete-file (concat (file-name-sans-extension file) ".elc")))
    (byte-compile-file file)))


(defun mep/buffer-name-contains-vterm ()
  (when-let ((buffer-name (buffer-file-name)))
    (string-match-p "vterm" buffer-name)))


(defun mep/change-window-size-j ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (and (null (window-in-direction 'below))
           (not (misenplace/buffer-name-contains-vterm)))
      (evil-window-decrease-height 1)
      (evil-window-increase-height 1)))


(defun mep/change-window-size-k ()
  "decreases window height if window below, increases otherwise"
  (interactive)
  (if (and (null (window-in-direction 'below))
           (not (misenplace/buffer-name-contains-vterm)))
      (evil-window-increase-height 1)
      (evil-window-decrease-height 1)))


(defun mep/doom-sync ()
  (interactive)
  (shell-command "/home/jordan/.config/emacs/bin/doom sync"))


(defun mep/change-window-size-h ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (window-in-direction 'right)
      (evil-window-decrease-width 1)
      (evil-window-increase-width 1)))


(defun mep/change-window-size-l ()
  "increases window height if window below, decreases otherwise"
  (interactive)
  (if (window-in-direction 'right)
      (evil-window-increase-width 1)
      (evil-window-decrease-width 1)))


(defun mep/increase-treemacs-width ()
  (let ((treemacs-buffer (get-buffer "*Treemacs*")))
    (when (and treemacs-buffer (get-buffer-window treemacs-buffer))
      (let* ((current-width (window-width (get-buffer-window treemacs-buffer)))
             (new-width (+ current-width 10)))
        (enlarge-window-horizontally (- new-width current-width) t)))))

(defun mep/decrease-treemacs-width ()
  (let ((treemacs-buffer (get-buffer "*Treemacs*")))
    (when (and treemacs-buffer (get-buffer-window treemacs-buffer))
      (let* ((current-width (window-width (get-buffer-window treemacs-buffer)))
             (new-width (- current-width 10)))
        (enlarge-window-horizontally (- new-width current-width) t)))))

(defun mep/window-with-vterm-buffer-p ()
  (catch 'found
    (walk-windows
     (lambda (window)
       (when (string-match-p "vterm" (buffer-name (window-buffer window)))
         (throw 'found t)))
     'nomini)
    nil))


  (defun mep/center (width)
        (interactive "nBuffer width: ")
        (let* ((adj (- (window-text-width) width))
               (total-margin (+ adj left-margin-width right-margin-width)))
          (setq left-margin-width  (/ total-margin 2))
          (setq right-margin-width (- total-margin left-margin-width)))
        (set-window-buffer (selected-window) (current-buffer)))


  (defun mep/disable-display-line-numbers-mode-hook ()
    (display-line-numbers-mode -1))


  (defun mep/my-clear ()
    (interactive)
    (let ((comint-buffer-maximum-size 0)) (comint-truncate-buffer)))


  (defun mep/test-pos-frame ()
    "A simple pos-frame tester fun"
    (interactive)
    (defvar my-posframe-buffer " *my-posframe-buffer*")
    (with-current-buffer (get-buffer-create my-posframe-buffer)
    (erase-buffer)
    (Lorem-ipsum-insert-paragraphs)
    (insert "Hello World"))
    (when (posframe-workable-p)
    (posframe-show my-posframe-buffer :position (point))))


  (defun mep/setup-wal ()
    (progn
      (setenv "LD_THEME" "dark")
      (shell-command "export LD_THEME=dark" "*std-err*")
      (setq  dark-mode nil)))


  (defun  mep/toggle-dark-mode ()
    "Toggle Dark mode"
    (interactive)
    (if dark-mode
	(progn
	  (setenv "LD_THEME" "light")
	  (shell-command "export LD_THEME=light" "*std-err*")
	  (shell-command "waldark" "*std-err*")
	  (counsel-load-theme-action "doom-opera-light")
	  (setq  dark-mode nil))
	(progn
          (setenv "LD_THEME" "dark")
	  (shell-command "export LD_THEME=dark" "*std-err*")
	  (counsel-load-theme-action "base16-darktooth")
	  (setq  dark-mode t)
	  (shell-command "waldark" "*std-err*"))))

  (defun mep/runwal ()
    (interactive)
    (shell-command "waldark" "*std-err*" "*std-err*"))


  (defun mep/dawn ()
    "Set theme to dawn"
    (interactive)
    (counsel-load-theme-action "base16-gruvbox-light-soft"))


  (defun mep/morning ()
    "Set theme to morning"
    (interactive)
    (counsel-load-theme-action "base16-gruvbox-light-hard"))


  (defun mep/day ()
    "Set theme to day"
    (interactive)
    (counsel-load-theme-action "base16-humanoid-light"))


  (defun mep/sunny ()
    "Set theme to sunny"
    (interactive)
    (counsel-load-theme-action "base16-mexico-light"))


  (defun mep/dusk ()
    "Set theme to dusk"
    (interactive)
    (counsel-load-theme-action "base16-nova"))


  (defun mep/evening ()
    "Set theme to evening"
    (interactive)
    (counsel-load-theme-action "base16-darktooth"))


  (defun mep/late-night ()
    "Set theme to late-night"
    (interactive)
    (counsel-load-theme-action "base16-pop"))


  (defun mep/set-target-buffer (buffer)
    "Switch to BUFFER. BUFFER may be a string or nil."
    (setq target-buffer buffer))


  (defun mep/ivy-set-process-target ()
    "Switch to another buffer."
    (interactive)
    (ivy-read "Switch to buffer: " #'internal-complete-buffer
	      :keymap ivy-switch-buffer-map
	      :preselect (buffer-name (other-buffer (current-buffer)))
	      :action #'mep/set-target-buffer
	      :matcher #'ivy--switch-buffer-matcher
	      :caller 'ivy-switch-buffer))


(defun mep/consult-set-process-target ()
  "Switch to another buffer using consult."
  (interactive)
  (consult-buffer
    :prompt "Switch to buffer: "
    :preselect (buffer-name (other-buffer (current-buffer)))
    :action #'mep/set-target-buffer))






  (defun mep/send-line-to-target-process ()
    "Send a line to process defined by target-buffer."
    (interactive)
    (setq proc (get-process target-buffer))
    (setq com (concat (buffer-substring (point-at-bol) (point-at-eol)) "\n"))
    (process-send-string target-buffer com)
    (next-line))


  (defun mep/increase-picom-transparency ()
    "Send a line to process defined by target-buffer."
    (interactive)
    (call-process-shell-command "inc_picom_emacs&" nil 0))


  (defun mep/decrease-picom-transparency ()
    "Send a line to process defined by target-buffer."
    (interactive)
    (call-process-shell-command "dec_picom_emacs&" nil 0))


  (defun mep/bg-elpy-shell-send-statement-and-step (&optional arg)
    (interactive "P")
    (elpy-shell-get-or-create-process 0.001)
    (elpy-shell-send-statement-and-step arg))


  ;; Project Templates

  (defun mep/make-python-project ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (setq python-template-repo "git@github.com:jordans1882/template-python.git")
    (setq proj-name (read-string "Enter your project name:"))
    (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
    (if (f-exists? proj-dir)
        (message (concatenate 'string proj-name " project already exists"))
      (progn (setq clone-command (concatenate 'string "git clone " python-template-repo " " proj-dir))
             (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
             (shell-command-to-string clone-command)
             (shell-command-to-string rm-git-command)
             (magit-init proj-dir)
             (projectile-add-known-project proj-dir))))


  (defun mep/select-tab-first ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 1))


  (defun mep/select-tab-second ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 2))


  (defun mep/select-tab-third ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 3))


  (defun mep/select-tab-fourth ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 4))


  (defun mep/select-tab-fifth ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 5))


  (defun mep/select-tab-sixth ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 6))


  (defun mep/select-tab-seventh ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 7))


  (defun mep/select-tab-eighth ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 8))


  (defun mep/select-tab-ninth ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (tab-bar-select-tab 9))


  (defun mep/make-r-project ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (setq r-template-repo "git@github.com:jordans1882/templater.git")
    (setq proj-name (read-string "Enter your project name:"))
    (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
    (setq clone-command (concatenate 'string "git clone " r-template-repo " " proj-dir))
    (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
    (shell-command-to-string clone-command)
    (shell-command-to-string rm-git-command)
    (magit-init proj-dir) ;; use hub for this?
    (projectile-add-known-project proj-dir)
    )


  (defun mep/make-cpp-project ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (setq cpp-template-repo "git@github.com:jordans1882/templatepp.git")
    (setq proj-name (read-string "Enter your project name:"))
    (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
    (setq clone-command (concatenate 'string "git clone " cpp-template-repo " " proj-dir))
    (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
    (shell-command-to-string clone-command)
    (shell-command-to-string rm-git-command)
    (magit-init proj-dir) ;; use hub for this?
    (projectile-add-known-project proj-dir))


  (defun misenplace/get-linux-os-name ()
    "Get the name of the linux operating system"
    (interactive)
    (replace-regexp-in-string
     "\n$" ""
     (shell-command-to-string
      "cat /etc/os-release | grep 'NAME' | head -n 1 | cut -c7- | sed 's/[/\"]//'")))


  (defun misenplace/server-shutdown ()
    "Save buffers, Quit, and Shutdown (kill) server"
    (interactive)
    (save-some-buffers)
    (kill-emacs)
    )


  (defun mep/revert-all-file-buffers ()
  "Refresh all open file buffers without confirmation.
  Buffers in modified (not yet saved) state in emacs will not be reverted. They
  will be reverted though if they were modified outside emacs.
  Buffers visiting files which do not exist any more or are no longer readable
  will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            (with-current-buffer buf (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          (let (kill-buffer-query-functions)
            (kill-buffer buf)
            (message "Killed non-existing/unreadable file buffer: %s" filename))))))
  (message "Finished reverting buffers containing unmodified files."))


 (defun mep/get-org-heading-info ()
   "show org-heading-components result"
   (interactive)
   (setq z (org-element-parse-buffer 'headline))
   (setq ordered_arr nil)
   (setq minT 100000)
   (setq maxT 0)
   (get_all_headings z 0)
   )


 (defun mep/color-cycle(i len)
   (setq fr 0.1)
   (setq center 128)
   (setq width 127)
   (setq phase (/ 6.28 3))
   (setq red (floor (+ (* (sin (+ (* fr i) 0)) width) center)))
   (setq green (floor (+ (* (sin (+ (* fr i) 2)) width) center)))
   (setq blue (floor (+ (* (sin (+ (* fr i) 4)) width) center)))
   (format "#%02x%02x%02x" red green blue)
   )


(defun mep/create-terminal-buffer-below ()
  "Create a new buffer below the current one with a terminal inside it."
  (interactive)
  (split-window-below)
  (other-window 1)
  (ansi-term (getenv "SHELL")))

