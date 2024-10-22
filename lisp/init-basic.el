;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 140)

(setq-default cursor-type '(bar . 5))
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; 关闭 自动备份
(setq make-backup-files nil)
;;修改成这个来显示行号，性能更好
(global-display-line-numbers-mode 1)


;;ivy
;; Encoding
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(set-language-environment 'chinese-gbk)
(prefer-coding-system 'utf-8-auto)


;;记住上个命令
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )
;; 保存光标历史
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))



(provide 'init-basic)
