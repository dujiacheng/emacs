(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setq make-backup-files nil)

(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
(put 'narrow-to-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/road/Dropbox/resource/jiacheng/daliy.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my-org-screenshot (basename) 
   "Take a screenshot into a time stamped unique-named file in the 
same directory as the org-buffer and insert a link to this file." 
   (interactive "sScreenshot name: ") 
   (if (equal basename "") 
       (setq basename (format-time-string "%Y%m%d_%H%M%S"))) 
   (setq filename 
         (concat (file-name-directory (buffer-file-name))
		 "imgs/"
                 (file-name-base (buffer-file-name)) 
                 "_" 
                 basename 
                 ".png")) 
   (call-process "gnome-screenshot" nil nil nil "-a" "-f" filename) 
   (insert "#+CAPTION:") 
   (insert basename) 
   (insert "\n") 
   (insert (concat "[[" filename "]]")) 
   (org-display-inline-images)) 


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/road/Dropbox/resource/jiacheng/task.org" "Tasks")
	 "* TODO %?\n %i\n %a")
	("j" "Journal" entry (file+datetree "~/road/Dropbox/resource/jiacheng/note.org")
	 "* %?\nEntered on %U\n %i\n %a")))

(show-paren-mode t)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)


;; Enable company globally for all mode
(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)
;; Set path to racer binary
(setq racer-cmd "/home/fire/.cargo/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "~/.rust/src/")

;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)


;;---------------- time ---------2018-01-05--------------------------

(defun filter-by-tags ()
   (let ((head-tags (org-get-tags-at)))
     (member current-tag head-tags)))

(defun org-clock-sum-today-by-tags (timerange &optional tstart tend noinsert)
  (interactive "P")
  (let* ((timerange-numeric-value (prefix-numeric-value timerange))
         (files (org-add-archive-files (org-agenda-files)))
         (include-tags '("WORK" "ENGLISH" "SCHOOL"
                         "LEARNING" "OUTPUT" "OTHER"))
         (tags-time-alist (mapcar (lambda (tag) `(,tag . 0)) include-tags))
         (output-string "")
         (tstart (or tstart
                     (and timerange (equal timerange-numeric-value 4) (- (org-time-today) 86400))
                     (and timerange (equal timerange-numeric-value 16) (org-read-date nil nil nil "Start Date/Time:"))
                     (org-time-today)))
         (tend (or tend
                   (and timerange (equal timerange-numeric-value 16) (org-read-date nil nil nil "End Date/Time:"))
                   (+ tstart 86400)))
         h m file item prompt donesomething)
    (while (setq file (pop files))
      (setq org-agenda-buffer (if (file-exists-p file)
                                  (org-get-agenda-file-buffer file)
                                (error "No such file %s" file)))
      (with-current-buffer org-agenda-buffer
        (dolist (current-tag include-tags)
          (org-clock-sum tstart tend 'filter-by-tags)
          (setcdr (assoc current-tag tags-time-alist)
                  (+ org-clock-file-total-minutes (cdr (assoc current-tag tags-time-alist)))))))
    (while (setq item (pop tags-time-alist))
      (unless (equal (cdr item) 0)
        (setq donesomething t)
        (setq h (/ (cdr item) 60)
              m (- (cdr item) (* 60 h)))
        (setq output-string (concat output-string (format "[-%s-] %.2d:%.2d\n" (car item) h m)))))
    (unless donesomething
      (setq output-string (concat output-string "[-Nothing-] Done nothing!!!\n")))
    (unless noinsert
        (insert output-string))
    output-string))
(org-babel-do-load-languages
    'org-babel-load-languages '((emacs-lisp . t)))
