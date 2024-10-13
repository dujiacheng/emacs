;;(server-mode 1)
(electric-pair-mode t)
(show-paren-mode t)

(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10) ;; 最近打开的10个文件, consult-buffer 会去读取recentf文件,然后展示

(delete-selection-mode t) ;;选中 文字输入能删除原有的字符

(progn  
	(defvar emax-root (concat (expand-file-name "~") "/emax"))
	(defvar emax-bin (concat emax-root "/bin"))
	(defvar emax-bin64 (concat emax-root "/bin64"))
	;; 解压emax到 C:\Users\cleve\AppData\Roaming 
	(setq exec-path (cons emax-bin exec-path))
	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

	(setq exec-path (cons emax-bin64 exec-path))
	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

	(setq emacsd-bin (concat user-emacs-directory "bin"))
	(setq exec-path (cons  emacsd-bin exec-path))
	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64下载地址: http://repo.msys2.org/mingw/sources/
	(setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))
	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	)
;; grep < ack < ag < ripgrep (rg)

;;ivy
;; Encoding
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(set-language-environment 'chinese-gbk)
(prefer-coding-system 'utf-8-auto)

(provide 'init-basic)
