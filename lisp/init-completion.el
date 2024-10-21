;; (use-package company
;;   :bind (:map company-active-map
;; 	      ("C-n" . 'company-select-next)
;; 	      ("C-p" . 'company-select-previous))
;;   :init
;;   (global-company-mode t)
;;   :config
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-idle-delay 0))

(use-package corfu
  :init
  (progn
    (setq corfu-auto t)
    (setq corfu-cycle t)
    (setq corfu-quit-at-boundary t)
    (setq corfu-quit-no-match t)
    (setq corfu-preview-current nil)
    (setq corfu-min-width 80)
    (setq corfu-max-width 100)
    (setq corfu-auto-delay 0.2)
    (setq corfu-auto-prefix 1)
    (setq corfu-on-exact-match nil)
    (global-corfu-mode)
    ))


(setq tab-always-indent 'complete)



;;(package-install 'vertico)
;;(vertico-mode t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode t))


(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)))


(use-package marginalia
  :ensure t
  :init
  (marginalia-mode t))




(use-package embark :ensure t)


(setq prefix-help-command 'embark-prefix-help-command)


(use-package consult :ensure t)

(progn
	(defvar emax-root (concat (expand-file-name "~") "/emax"))
	(defvar emax-bin (concat emax-root "/bin"))
	(defvar emax-bin64 (concat emax-root "/bin64"))

	(setq exec-path (cons emax-bin exec-path))
	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

	(setq exec-path (cons emax-bin64 exec-path))
	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

	(setq emacsd-bin (concat user-emacs-directory "bin"))
	(setq exec-path (cons  emacsd-bin exec-path))
	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64
	;;下载地址: http://repo.msys2.org/mingw/sources/
	(setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	)



(add-to-list 'process-coding-system-alist '("es" gbk . gbk))
(setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))
 (add-to-list 'process-coding-system-alist 
	       '("[rR][gG]" . (utf-8-dos . windows-1251-dos)))

 (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous)

(eval-after-load 'consult
  (progn
      (setq 
        consult-narrow-key "<"
        consult-line-numbers-widen t
        consult-async-min-input 2
        consult-async-refresh-delay  0.15
        consult-async-input-throttle 0.2
        consult-async-input-debounce 0.1)
    ))




(use-package embark-consult  :ensure t)

(use-package wgrep  :ensure t)
(setq wgrep-auto-save-buffer t)

(eval-after-load 'consult
  '(eval-after-load 'embark
     '(progn
	(require 'embark-consult)
	(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))))

;multiple cursor 
(provide 'init-completion)
