
(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
;;(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
;;(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切

;;设置 鼠标右键=复制  todd
(global-set-key [mouse-3] 'kill-ring-save)   

(global-set-key (kbd "s-v") 'scroll-up-command) ; 将 S-v 绑定为向下翻页 todd
(global-set-key (kbd "C-v") 'yank)                ; 将 C-v 绑定为粘贴  todd



(global-set-key (kbd "<f1>") 'func)

(global-set-key (kbd "s-p") 'toggle-chinese-search)



(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(global-set-key (kbd "C-x b") 'consult-buffer)

;;swiper
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-s i") 'consult-imenu)

(global-set-key (kbd "C-;") 'embark-act)

(with-eval-after-load 'embark  
  (define-key embark-file-map (kbd "E") #'consult-directory-externally))


(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(global-set-key (kbd "C-c p f") 'project-find-file)
(global-set-key (kbd "C-c p s") 'consult-ripgrep)



(provide 'init-keybindings)
