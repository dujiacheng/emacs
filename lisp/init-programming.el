;;(server-mode 1)
(global-display-line-numbers-mode 1)
;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)



(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default cursor-type '(bar . 5))
(global-hl-line-mode 1)

(electric-pair-mode t)
(show-paren-mode t)
(setq make-backup-files nil)
(delete-selection-mode t)

(use-package recentf
  :init
  (recentf-mode 1)
  :custom
  (recentf-max-menu-items 10))

(message " 无受想行识，无眼耳鼻舌身意，无色声香味触法，无眼界，乃至无意识界 ")
(message "  ")

(global-auto-revert-mode 1)

(setq auto-save-default nil)

(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)


(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)

(use-package quickrun
    :ensure t
    :commands (quickrun)
    :init
    (quickrun-add-command "c++/c1z"
    '((:command . "g++")
	(:exec . ("%c -std=c++1z %o -o %e %s"
		"%e %a"))
	(:remove . ("%e")))
    :default "c++"))

(global-set-key (kbd "<f5>") 'quickrun)

(use-package treesit-auto
  :demand
  :init
  (progn
    (setq treesit-font-lock-level 4)
    )
  :config
  (global-treesit-auto-mode)
  )

(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
         (org-mode . yas-minor-mode))
  :init
  :config
  (progn
    (setq hippie-expand-try-functions-list
          '(yas/hippie-try-expand
            try-complete-file-name-partially
            try-expand-all-abbrevs
            try-expand-dabbrev
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-lisp-symbol-partially
            try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)



(provide 'init-programming)
