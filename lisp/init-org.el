(with-eval-after-load 'org
  (require 'org-tempo)  ;开启easy template

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

(require 'org-checklist)

(setq org-log-done 'note)
(setq org-log-into-drawer t)

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/gtd.org"))
(setq org-agenda-span 'day)

(setq org-return-follows-link t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gtd.org" "Workspace")
	 "* TODO [#B] %?\n  %i\n %U"
	 :empty-lines 1)

	("x" "Web Collections" entry
	 (file+headline org-agenda-file-note "Web")
	 "* %U %:annotation\n\n%:initial\n\n%?")
	))

(setq org-agenda-file-note (expand-file-name "~/notes.org"))

(global-set-key (kbd "C-c r") 'org-capture)

(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;; ...other commands here
	))
  )



(use-package org
  :pin melpa
  :ensure t
)

(use-package org-contrib
  :pin nongnu
  )



(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(with-eval-after-load 'org-capture
      (defun org-hugo-new-subtree-post-capture-template ()
        "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
        (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
               (fname (org-hugo-slug title)))
          (mapconcat #'identity
                     `(
                       ,(concat "* TODO " title)
                       ":PROPERTIES:"
                       ,(concat ":EXPORT_FILE_NAME: " fname)
                       ":END:"
                       "\n\n")          ;Place the cursor here finally
                     "\n")))

      (add-to-list 'org-capture-templates
                   '("h"                ;`org-capture' binding + h
                     "Hugo post"
                     entry
                     ;; It is assumed that below file is present in `org-directory'
                     ;; and that it has a "Blog Ideas" heading. It can even be a
                     ;; symlink pointing to the actual location of all-posts.org!
                     (file+headline "c:/Users/lionqu/blog/all-blog.org" "Blog Ideas")
                     (function org-hugo-new-subtree-post-capture-template))))

(use-package org-download
    :ensure t
    :demand t
    :after org
    :config
    (add-hook 'dired-mode-hook 'org-download-enable)
    ;;
    (setq org-download-screenshot-method "powershell -c Add-Type -AssemblyName System.Windows.Forms;$image = [Windows.Forms.Clipboard]::GetImage();$image.Save('%s', [System.Drawing.Imaging.ImageFormat]::Png)")
    (defun org-download-annotate-default (link)
      "Annotate LINK with the time of download."
      (make-string 0 ?\s))

    (setq-default org-download-heading-lvl nil
		  org-download-image-dir "./img"
		  ;; org-download-screenshot-method "screencapture -i %s"
		  org-download-screenshot-file (expand-file-name "screenshot.jpg" temporary-file-directory)))

  (use-package org-roam
    :ensure t
    :custom
    (org-roam-directory (file-truename "~/org"))
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n g" . org-roam-graph)
           ("C-c n i" . org-roam-node-insert)
           ("C-c n c" . org-roam-capture)
           ;; Dailies
           ("C-c n j" . org-roam-dailies-capture-today))
    :config
    ;; If you're using a vertical completion framework, you might want a more informative completion interface
    (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:20}" 'face 'org-tag)))
    (org-roam-db-autosync-mode)
    ;sqlite3 
    ;; If using org-roam-protocol
    (require 'org-roam-protocol))

(use-package org-roam-ui
  :ensure nil
  :vc (:fetcher "github" :repo "org-roam/org-roam-ui"))
(provide 'init-org)
