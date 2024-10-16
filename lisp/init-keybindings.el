
(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key [mouse-3] 'kill-ring-save)  ;;设置 鼠标右键=复制  todd 

(global-set-key (kbd "C-v") 'yank)                ; 原scroll-up-command  todd
(global-set-key (kbd "C-z") 'undo) ;原 suspend-frame
(global-set-key (kbd "C-s") 'save-buffer) ;; 原isearch-forward 被consult-line 替代了

(global-set-key (kbd "s-v") 'scroll-up-command) ; 向下翻页 todd
(global-set-key (kbd "s-h") 'suspend-frame) ;最小化
(global-set-key (kbd "s-s") 'consult-line) ;搜索

(global-set-key (kbd "s-p") 'toggle-chinese-search) ;;中文搜索 好像没啥用

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-x b") 'consult-buffer) ;;替代自带buffer
(global-set-key (kbd "M-s i") 'consult-imenu) ;; 快速导航到当前缓冲区中定义的项（如函数、变量等）的命令

(global-set-key (kbd "C-;") 'embark-act)   
(with-eval-after-load 'embark  
  (define-key embark-file-map (kbd "E") #'consult-directory-externally)) ;; 用windows explore.exe 打开文件夹
(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write);;批量替换 

(global-set-key (kbd "C-c p f") 'project-find-file) ;;当前文件夹 找文件
(global-set-key (kbd "C-c p s") 'consult-ripgrep)


;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-keybindings)
