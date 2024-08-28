
;; Utility funs

(defun modi/revert-all-file-buffers ()
"Refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in emacs will not be reverted. They
will be reverted though if they were modified outside emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
(interactive)
(dolist (buf (buffer-list))
  (let ((filename (buffer-file-name buf)))
    ;; Revert only buffers containing files, which are not modified;
    ;; do not try to revert non-file buffers like *Messages*.
    (when (and filename
	 (not (buffer-modified-p buf)))
(if (file-readable-p filename) ;; If the file exists and is readable, revert the buffer.
    (with-current-buffer buf
      (revert-buffer :ignore-auto :noconfirm :preserve-modes))
  ;; Otherwise, kill the buffer.
  (let (kill-buffer-query-functions) ; No query done when killing buffer
    (kill-buffer buf)
    (message "Killed non-existing/unreadable file buffer: %s" filename))))))
(message "Finished reverting buffers containing unmodified files."))

;; UI/UX utilities

(defun my/center (width)
  (interactive "nBuffer width: ")
  (let* ((adj (- (window-text-width) width))
   (total-margin (+ adj left-margin-width
		    right-margin-width)))
  (setq left-margin-width  (/ total-margin 2))
  (setq right-margin-width (- total-margin left-margin-width)))
  (set-window-buffer (selected-window) (current-buffer)))
(defun select-tab-first ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 1))
(defun select-tab-second ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 2))
(defun select-tab-third ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 3))
(defun select-tab-fourth ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 4))
(defun select-tab-fifth ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 5))
(defun select-tab-sixth ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 6))
(defun select-tab-seventh ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 7))
(defun select-tab-eighth ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 8))
(defun select-tab-ninth ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (tab-bar-select-tab 9))
(defun test-pos-frame ()
  "A simple pos-frame tester fun"
  (interactive)
  (defvar my-posframe-buffer " *my-posframe-buffer*")

  (with-current-buffer (get-buffer-create my-posframe-buffer)
  (erase-buffer)
  ;; (Lorem-ipsum-insert-paragraphs)
  (insert "Hello World"))

  (when (posframe-workable-p)
  (posframe-show my-posframe-buffer
	    :position (point))))
(defun my-clear ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))
(defun disable-display-line-numbers-mode-hook ()
  (display-line-numbers-mode -1))


;; define function to shutdown emacs server instance
(defun server-shutdown ()
    "Save buffers, Quit, and Shutdown (kill) server"
    (interactive)
    (save-some-buffers)
    (kill-emacs)
    )

;; Theme utilities
(defun setup-wal ()
  (progn
    (setenv "LD_THEME" "dark")
    (shell-command "export LD_THEME=dark" "*std-err*")
    (setq  dark-mode nil)))
(setup-wal)
(defun dawn ()
  "Set theme to dawn"
  (interactive)
  (counsel-load-theme-action "base16-gruvbox-light-soft"))
(defun morning ()
  "Set theme to morning"
  (interactive)
  (counsel-load-theme-action "base16-gruvbox-light-hard"))
(defun day ()
  "Set theme to day"
  (interactive)
  (counsel-load-theme-action "base16-humanoid-light"))
(defun sunny ()
  "Set theme to sunny"
  (interactive)
  (counsel-load-theme-action "base16-mexico-light"))
(defun dusk ()
  "Set theme to dusk"
  (interactive)
  (counsel-load-theme-action "base16-nova"))
(defun evening ()
  "Set theme to evening"
  (interactive)
  (counsel-load-theme-action "base16-darktooth"))
(defun late-night ()
  "Set theme to late-night"
  (interactive)
  (counsel-load-theme-action "base16-pop"))
(defun toggle-dark-mode ()
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
(defun runwal ()
  (interactive)
  (shell-command "waldark" "*std-err*" "*std-err*")
  )
(defun increase-picom-transparency ()
  "Send a line to process defined by target-buffer."
  (interactive)
  (call-process-shell-command "inc_picom_emacs&" nil 0)
)
(defun decrease-picom-transparency ()
  "Send a line to process defined by target-buffer."
  (interactive)
  (call-process-shell-command "dec_picom_emacs&" nil 0)
)

(defun read-file-contents (filename)
  (setq contents (with-temp-buffer
		   (insert-file-contents filename)
		   (buffer-string))) contents)
(defun get-ldmode ()
  (interactive)
  (let ((ret  (if (string-match "\\blight\\b" (read-file-contents "~/.cache/ldmode"))
      "light" "dark")))  ret))
(defun set-light-mode()
  (interactive)
    (load-theme 'doom-one-light))
(defun set-dark-mode()
  (interactive)
  (load-theme 'doom-one))
(defun setup-theme ()
  (interactive)
  (let ((ldmode (get-ldmode)))
    (if (string= ldmode "light") (set-light-mode) (set-dark-mode))))

;; Repl utilities
(defun set-target-buffer (buffer)
  "Switch to BUFFER.
UFFER may be a string or nil."
  (setq target-buffer buffer))
(defun ivy-set-process-target ()
  "Switch to another buffer."
  (interactive)
  (ivy-read "Switch to buffer: " #'internal-complete-buffer
      :keymap ivy-switch-buffer-map
      :preselect (buffer-name (other-buffer (current-buffer)))
      :action #'set-target-buffer
      :matcher #'ivy--switch-buffer-matcher
      :caller 'ivy-switch-buffer))
(defun send-line-to-target-process ()
    "Send a line to process defined by target-buffer."
    (interactive)
    (if (void-variable 'target-buffer)
	(mep/ivy-set-process-target))
    (setq proc (get-process target-buffer))
    (setq com (concat (buffer-substring (point-at-bol) (point-at-eol)) "\n"))
    (process-send-string target-buffer com)
    (next-line)
  )


(defun send-line-to-target-process ()
    "Send a line to process defined by target-buffer."
    (interactive)
    (if (not (boundp 'target-buffer))
	(mep/ivy-set-process-target))
    (if (eq evil-state 'visual)
	(let ((beginning (region-beginning))
	    (end (region-end)))
	  (process-send-string target-buffer (buffer-substring-no-properties beginning end))
	  (evil-normal-state)
	  (previous-line))
    (setq proc (get-process target-buffer))
    (setq com (concat (buffer-substring (point-at-bol) (point-at-eol)) "\n"))
    (process-send-string target-buffer com))
    (next-line)
  )


;; (if (eq evil-state 'visual)
;;     (message "You are in Evil's visual state!")
;;   (message "You are not in Evil's visual state."))

;; (if (eq evil-state 'visual)
;;     (let ((beginning (region-beginning))
;;           (end (region-end)))
;;       (message "Highlighted text: %s" (buffer-substring-no-properties beginning end)))
;;   (message "You are not in Evil's visual state."))





(defun bg-elpy-shell-send-statement-and-step (&optional arg)
  (interactive "P")
  ;; Force the process to start completely by sitting a bit to avoid this warning:
  ;;
  ;;  Warning (python): Your ‘python-shell-interpreter’ doesn’t seem
  ;;  to support readline, yet ‘python-shell-completion-native-enable’
  ;;  was t and "python" is not part of the
  ;;  ‘python-shell-completion-native-disabled-interpreters’ list.
  ;;  Native completions have been disabled locally.
  ;;  Refer to https://github.com/jorgenschaefer/elpy/issues/887
  ;;
  (elpy-shell-get-or-create-process 0.001)
  (elpy-shell-send-statement-and-step arg))

;; Language Project Template
;; (defun make-python-project ()
;;   "Prompt user to enter a directory name and create project."
;;   (interactive)
;;   (setq python-template-repo "git@github.com:jordans1882/template-python.git")
;;   (setq proj-name (read-string "Enter your project name:"))
;;   (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
;;   (if (f-exists? proj-dir)
;; message (concatenate 'string proj-name " project already exists"))
;; progn (setq clone-command (concatenate 'string "git clone " python-template-repo " " proj-dir))
;; (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
;; (shell-command-to-string clone-command)
;; (shell-command-to-string rm-git-command)
;; (magit-init proj-dir) ;; use hub for this?
;; (projectile-add-known-project proj-dir))))
;; (defun make-r-project ()
;;   "Prompt user to enter a directory name and create project."
;;   (interactive)
;;   (setq r-template-repo "git@github.com:jordans1882/templater.git")
;;   (setq proj-name (read-string "Enter your project name:"))
;;   (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
;;   ;; TODO: Add check if project already exists for make-r-project
;;   (setq clone-command (concatenate 'string "git clone " r-template-repo " " proj-dir))
;;   (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
;;   (shell-command-to-string clone-command)
;;   (shell-command-to-string rm-git-command)
;;   (magit-init proj-dir) ;; use hub for this?
;;   (projectile-add-known-project proj-dir)
;;   )
(defun make-cpp-project ()
    "Prompt user to enter a directory name and create project."
    (interactive)
    (setq cpp-template-repo "git@github.com:jordans1882/templatepp.git")
    (setq proj-name (read-string "Enter your project name:"))
    (setq proj-dir (concatenate 'string "~/git_repos/" proj-name))
    ;; TODO: Add check if project already exists for make-cpp-project
    (setq clone-command (concatenate 'string "git clone " cpp-template-repo " " proj-dir))
    (setq rm-git-command (concatenate 'string "rm -rf " proj-dir "/.git"))
    (shell-command-to-string clone-command)
    (shell-command-to-string rm-git-command)
    (magit-init proj-dir) ;; use hub for this?
    (projectile-add-known-project proj-dir))


;; General utilities
(defun get-linux-os-name ()
  "Get the name of the linux operating system"
  (interactive)
  (replace-regexp-in-string
   "\n$" ""
   (shell-command-to-string
    "cat /etc/os-release | grep 'NAME' | head -n 1 | cut -c7- | sed 's/[/\"]//'")))

;; Old Gant chart stuff
(defun prop_ ()
  (interactive)
  (setq properties-list '(":TYPE: Task" ":DEP: none" ":PROGRESS: 0"))

  (insert ":PROPERTIES:\n")
  (org-cycle)

  (dolist (elt properties-list)
    (insert  elt)
    (insert "\n")
    (org-cycle)
    )
  (insert ":END:\n"))
;; (global-set-key (kbd "C-=") 'prop_)
(defun get_all_headings (arr deep)
   (let ( (size (length arr)) (i 2));;get the size of the arr
     (while ( < i size );;iterate for each headings/subheadings
	(setq name (plist-get (elt (elt arr i) 1) :title))
	(setq scheduled (plist-get (elt (elt arr i) 1) :scheduled))
	(setq deadline (plist-get (elt (elt arr i) 1) :deadline))
	(setq todo (plist-get (elt (elt arr i) 1) :todo-type))
	(setq priority (plist-get (elt (elt arr i) 1) :priority))
	(setq l nil)
	(add-to-list 'l name)
	(add-to-list 'l deep)
	(if priority nil (setq priority 100))
	(add-to-list 'l priority)
	(add-to-list 'l  "na")

	(setq scheduled_vect nil)
	(if scheduled
	    (let ((tt (elt scheduled 1)) )
	      (add-to-list 'l t)
	      (setq ys (plist-get tt :year-start))
	      (setq ms (plist-get tt :month-start))
	      (setq ds (plist-get tt :day-start))
	      (setq hs (plist-get tt :hour-start))
	      (setq mins (plist-get tt :minute-start))
	      (unless hs (setq hs 0) )
	      (unless mins (setq mins 0) )
	      (setq ts (+ (* (- ys 2020) 8760) (* (calendar-day-number (list ms ds ys)) 24) hs (/ mins 60.0)))
	      (setq scheduled_vect (vector ts hs ds ms ys))
	      )
	  )

	(setq deadline_vect nil)
	(if deadline
	    (let ((tt (elt deadline 1)) )

	      (add-to-list 'l t)
	      (setq ysd (plist-get tt :year-start))
	      (setq msd (plist-get tt :month-start))
	      (setq dsd (plist-get tt :day-start))
	      (setq hsd (plist-get tt :hour-start))
	      (setq minsd (plist-get tt :minute-start))
	      (unless hsd (setq hsd 0) )
	      (unless minsd (setq minsd 0) )
	      (setq tsd (+ (* (- ysd 2020) 8760) (* (calendar-day-number (list msd dsd ysd)) 24) hsd (/ minsd 60.0)))
	      (setq deadline_vect (vector tsd hsd dsd msd ysd))
	      )
	  (if scheduled
	      (setq deadline_vect (vector (1+ ts) hs ds ms ys))
	    nil
	    )
	  )
	(if scheduled
	    (let ((a 1))
	      (add-to-list 'l (vector scheduled_vect deadline_vect))
	      (if (> minT ts)
		  (setq minT ts)
		nil)
	      (if (< maxT tsd)
		  (setq maxT tsd)
		nil)
	      )
	  (add-to-list 'l nil)
	  )

	(if (< (elt (reverse l) 2) 68)
	    (let ((a 1))
	      (add-to-list 'ordered_arr (reverse l))
	      (get_all_headings (elt arr i) (1+ deep))
	      )
	  nil
	  )
	(setq i (1+ i))
	)
     )

   )
(defun draw-gantt ()
  "draw a gantt svg "
  (interactive)
  (get-org-heading-info)
  (require 'svg)
  (setq H 600)
  (setq W (window-pixel-width ))
  (setq sx 150)
  (setq sy 25)
  (setq Fsize 10)
  (setq svg (svg-create W H :stroke "black" ))
  (svg-rectangle svg 0 0 W H :fill "#ffffff" :stroke-width 0)

  (setq size (length ordered_arr))
  (setq i 0)
  (setq arr (reverse ordered_arr))
  (setq dt (float (- maxT minT)))
  (setq dx (float (- W sx)))
  (while (< i size)
    (let ((deep (elt (elt arr i) 1))
    (name (elt (elt arr i) 0))
    (visible (elt (elt arr i) 4)) )

(if (= deep 0)
    (svg-line svg 0 (+ sy (+ 2 (* i (+ Fsize 4)))) W (+ sy (+ 2 (* i (+ Fsize 4)))))
  nil
  )

(svg-text svg name :x (+ 3 (* 8 deep)) :y (+ sy (* i (+ Fsize 4))) :stroke-width 0.5 :font-size (concat (number-to-string Fsize) "px") :font-family "Helvetica")
(if visible
    (let ((ts (elt (elt (elt (elt arr i) 5) 0) 0))
	  (te (elt (elt (elt (elt arr i) 5) 1) 0)))

      (svg-rectangle svg  (+ sx (* dx (/ (- ts minT) dt))) (+ (- sy Fsize) 1 (* i (+ Fsize 4)))  (* dx (/ (- te ts) dt)) (+ -2 Fsize) :fill (color-cycle i size))
      (if (< (elt (elt arr i) 2) 68 )
	  (let ( (day  (elt (elt (elt (elt arr i) 5) 0) 2))
		 (month  (elt (elt (elt (elt arr i) 5) 0) 3)) )
	    (svg-line svg (+ sx (* dx (/ (- ts minT) dt))) (- (- sy Fsize) 2) (+ sx (* dx (/ (- ts minT) dt))) H :stroke-dasharray 4)
	    (svg-text svg (format "%02d/%02d" day month) :x (- (+ sx (* dx (/ (- ts minT) dt))) 15) :y (+ Fsize 1) :stroke-width 0.5 :font-size (concat (number-to-string Fsize) "px") :font-family "Helvetica")
	    )
	)
      )
  nil
  )
(setq i (1+ i))
)
    )
  (setq tnow (+ (* (- (elt (calendar-current-date) 2) 2020) 8760) (* (calendar-day-number (calendar-current-date)) 24)))
  (if (> tnow minT)
(let ((a 1))
  (svg-line svg (+ sx (* dx (/ (- tnow minT) dt))) (- (- sy Fsize) 2) (+ sx (* dx (/ (- tnow minT) dt))) H :stroke-dasharray 4 :stroke "red")
  )
    nil
    )
  ;; create or get a gantt buffer
  (let (($buf (get-buffer-create "*gantt*")))
    (with-current-buffer $buf
(erase-buffer)
(svg-insert-image svg));;insert the svh
    (display-buffer-in-side-window $buf `((side . bottom)
				    (window-height . ,(+ 2 size)) ;;backquote + coma to evaluate var
				    (slot . 0)));;display the window at the bottom
    )
  )
;; (global-set-key (kbd "C-=") 'draw-gantt)
(defun get-org-heading-info ()
  "show org-heading-components result"
  (interactive)
  (setq z (org-element-parse-buffer 'headline))
  (setq ordered_arr nil)
  (setq minT 100000)
  (setq maxT 0)
  (get_all_headings z 0)
  )

(defun color-cycle(i len)
   (setq fr 0.1)
   (setq center 128)
   (setq width 127)
   (setq phase (/ 6.28 3))
   (setq red (floor (+ (* (sin (+ (* fr i) 0)) width) center)))
   (setq green (floor (+ (* (sin (+ (* fr i) 2)) width) center)))
   (setq blue (floor (+ (* (sin (+ (* fr i) 4)) width) center)))
   (format "#%02x%02x%02x" red green blue)
   )


(defun get-project-root ()
  (interactive)
  (when buffer-file-name
    (let ((root (locate-dominating-file buffer-file-name ".git")))
      (if root
          (expand-file-name root)
        nil))))


(defun run-cpp-example ()
  (interactive)
  (let* ((basename (file-name-base (file-name-nondirectory (buffer-file-name))))
	 (projectroot (get-project-root)))
    (with-current-buffer "*terminal*"
      (progn
	(process-send-string (get-buffer-process (current-buffer))
			     (concat "make examples\n"))
	(process-send-string (get-buffer-process (current-buffer))
			     (concat (concat (concat projectroot "build/examples/") basename) "\n"))))))

