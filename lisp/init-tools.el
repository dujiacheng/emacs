(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab"));; 先加载

(require 'awesome-tab)
(awesome-tab-mode t)

(defun awesome-tab-buffer-groups ()
"`awesome-tab-buffer-groups' control buffers' group rules.
Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".    特定的mode 可以单独归到一个buffer内
Other buffer group by `awesome-tab-get-group-name' with project name. 用后缀名来分组，比如.txt的都在一个buffer内。"
(list
(cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
	(memq major-mode '(magit-process-mode
			    magit-status-mode
			    magit-diff-mode
			    magit-log-mode
			    magit-file-mode
			    magit-blob-mode
			    magit-blame-mode)))
    "Emacs")
    ((derived-mode-p 'eshell-mode)
    "EShell")
    ((derived-mode-p 'dired-mode)
    "Dired")
    ((memq major-mode '(org-mode org-agenda-mode diary-mode))
    "OrgMode")
    ((derived-mode-p 'eaf-mode)
    "EAF")
    (t
     (awesome-tab-get-group-name (current-buffer))))))


(package-install 'pyim);;拼音
;;拼音缩写来搜索 没成功
(defun eh-orderless-regexp (orig_func component)
    (let ((result (funcall orig_func component)))
      (pyim-cregexp-build result)))


  (defun toggle-chinese-search ()
    (interactive)
    (if (not (advice-member-p #'eh-orderless-regexp 'orderless-regexp))
        (advice-add 'orderless-regexp :around #'eh-orderless-regexp)
      (advice-remove 'orderless-regexp #'eh-orderless-regexp)))

  (defun disable-py-search (&optional args)
    (if (advice-member-p #'eh-orderless-regexp 'orderless-regexp)
        (advice-remove 'orderless-regexp #'eh-orderless-regexp)))

  ;; (advice-add 'exit-minibuffer :after #'disable-py-search)
(add-hook 'minibuffer-exit-hook 'disable-py-search) ;;取消拼音缩写搜索模式

;;modeline上显示我的所有的按键和执行的命令，28.1安装有问题
;;(package-install 'keycast)
;;(keycast-mode 1)


(provide 'init-tools)
