(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

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
 '(org-agenda-files
   (quote
    ("~/asdf.org" "~/road/Dropbox/resource/jiacheng/daliy.org"))))
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
