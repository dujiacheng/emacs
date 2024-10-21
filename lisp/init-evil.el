
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode)


  (setcdr evil-insert-state-map nil)

  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  (define-key evil-normal-state-map (kbd "[ SPC") (lambda () (interactive) (evil-insert-newline-above) (forward-line)))

  (define-key evil-normal-state-map (kbd "] SPC") (lambda () (interactive) (evil-insert-newline-below) (forward-line -1)))

   (define-key evil-insert-state-map (kbd "C-;") 'flyspell-correct-previous)
  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-motion-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'next-buffer) 

  (evil-define-key 'normal dired-mode-map
  (kbd "<RET>") 'dired-find-alternate-file
  (kbd "C-k") 'dired-up-directory
  "`" 'dired-open-term
  "q" 'quit-window
  "o" 'dired-find-file-other-window
  ")" 'dired-omit-mode)
  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
  )
;; install undo-tree  -operator
 (use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))


(use-package general
  :init
  (with-eval-after-load 'evil
    (general-add-hook 'after-init-hook
                      (lambda (&rest _)
                        (when-let ((messages-buffer (get-buffer "*Messages*")))
                          (with-current-buffer messages-buffer
                            (evil-normalize-keymaps))))
                      nil
                      nil
                      t))


  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (defmacro +general-global-menu! (name infix-key &rest body)
    "Create a definer named +general-global-NAME wrapping global-definer.
Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
    (declare (indent 2))
    `(progn
       (general-create-definer ,(intern (concat "+general-global-" name))
         :wrapping global-definer
         :prefix-map ',(intern (concat "+general-global-" name "-map"))
         :infix ,infix-key
         :wk-full-keys nil
         "" '(:ignore t :which-key ,name))
       (,(intern (concat "+general-global-" name))
        ,@body)))

  (general-create-definer global-leader
    :keymaps 'override
    :states '(emacs normal hybrid motion visual operator)
    :prefix ","
    "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode)))))))


(use-package general
  :init
  (global-definer
    "!" 'shell-command
    "SPC" 'execute-extended-command
    "TAB" 'spacemacs/alternate-buffer
    "'" 'vertico-repeat
    "v" 'er/expand-region
    "+" 'text-scale-increase
    "-" 'text-scale-decrease
    "u" 'universal-argument
    "=" 'indent-buffer
    "v" 'er/expand-region
    ;flymake
    "en" 'flymake-goto-next-error
    "ep" 'flymake-goto-prev-error
    "el" 'flymake-show-buffer-diagnostics
    "0" 'select-window-0
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5

    "hc" 'zilongshanren/clearn-highlight
    "hH" 'zilongshanren/highlight-dwim
    "hdf" 'describe-function
    "hdv" 'describe-variable
    "hdk" 'describe-key
    ))

(+general-global-menu! "window" "w"
  "/" 'split-window-right
  "-" 'split-window-below
  "m" 'delete-other-windows
  "u" 'winner-undo
  "z" 'winner-redo
  "w" 'esw/select-window
  "s" 'esw/swap-two-windows
  "d" 'esw/delete-window
  "=" 'balance-windows-area
  "r" 'esw/move-window
  "x" 'resize-window
  "H" 'buf-move-left
  "L" 'buf-move-right
  "J" 'buf-move-down
  "K" 'buf-move-up)

(+general-global-menu! "buffer" "b"
    "d" 'kill-current-buffer
    "b" '(consult-buffer :which-key "consult buffer")
    "B" 'switch-to-buffer
    "p" 'previous-buffer
    "R" 'rename-buffer
    "M" '((lambda () (interactive) (switch-to-buffer "*Messages*"))
	  :which-key "messages-buffer")
    "n" 'next-buffer
    "i" 'ibuffer
    "f" 'my-open-current-directory
    "k" 'kill-buffer
    "y" 'copy-buffer-name
    "K" 'kill-other-buffers)

  (+general-global-menu! "project" "p"
    "f" 'project-find-file
    "r" 'consult-recent-file
    "s" 'project-find-regexp
    "d" 'project-dired
    "b" 'consult-project-buffer
    "e" 'project-eshell
    "c" 'project-compile
    "p" 'project-switch-project
    "a" 'project-remember-projects-under
    "x" 'project-forget-project)

  (+general-global-menu! "search" "s"
    "j" 'consult-imenu
    "p" 'consult-ripgrep
    "k" 'consult-keep-lines
    "f" 'consult-focus-lines)


  (+general-global-menu! "file" "f"
    "f" 'find-file
    "r" 'consult-recent-file
    "L" 'consult-locate
    "d" 'consult-dir
    "ed" 'open-init-file
    "s" 'save-buffer
    "w" 'sudo-edit
    "S" 'save-some-buffers
    "j"  'dired-jump
    "y" 'copy-file-name
    )

  (+general-global-menu! "window" "w"
    "/" 'split-window-right
    "-" 'split-window-below
    "m" 'delete-other-windows
    "u" 'winner-undo
    "z" 'winner-redo
    )

(+general-global-menu! "layout" "l"
  "l" 'tabspaces-switch-or-create-workspace
  "L" 'tabspaces-restore-session
  "p" 'tabspaces-open-or-create-project-and-workspace
  "f" 'tabspaces-project-switch-project-open-file
  "s" 'tabspaces-save-session
  "B" 'tabspaces-switch-buffer-and-tab
  "b" 'tabspaces-switch-to-buffer
  "R" 'tab-rename
  "TAB" 'tab-bar-switch-to-recent-tab
  "r" 'tabspaces-remove-current-buffer
  "k" 'tabspaces-close-workspace)

(use-package evil-anzu
  :ensure t
  :after evil
  :diminish
  :demand t
  :init
  (global-anzu-mode t))

(use-package evil-collection
  :ensure t
  :demand t
  :config
  (setq evil-collection-mode-list (remove 'lispy evil-collection-mode-list))
  (evil-collection-init)

   (cl-loop for (mode . state) in
	    '((org-agenda-mode . normal)
	      (Custom-mode . emacs)
	      (eshell-mode . emacs)
	      (makey-key-mode . motion))
	    do (evil-set-initial-state mode state)))

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode 1))

(use-package evil-nerd-commenter
  :init
  (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  )

(use-package evil-snipe
  :ensure t
  :diminish
  :init
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-matchit
  :ensure
  :init
  (global-evil-matchit-mode 1))

(use-package iedit
  :ensure t
  :init
  (setq iedit-toggle-key-default nil)
  :config
  (define-key iedit-mode-keymap (kbd "M-h") 'iedit-restrict-function)
  (define-key iedit-mode-keymap (kbd "M-i") 'iedit-restrict-current-line))

(use-package evil-multiedit
  :ensure t
  :commands (evil-multiedit-default-keybinds)
  :init
  (evil-multiedit-default-keybinds))

(provide 'init-evil)
