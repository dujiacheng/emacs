(package-install 'company)
(global-company-mode 1)
(setq company-minimum-prefix-length 1) ;;打一个字符就补全
(setq company-idle-delay 0) ;;降低补全的延迟 
(setq tab-always-indent 'complete) ;; 在不完全的变量后面 按tab会出现complete这个buffer

(package-install 'vertico) ;;M-x的时候 从水平补全变成垂直，C-x C-f 也是一样
(vertico-mode t)

(package-install 'orderless) 
(setq completion-styles '(orderless))  ;;M-x的时候 支持模糊匹配 

(package-install 'marginalia)  ;; mini buffer 增强,命令的注释 C-h v ，C-x C-f 也会被增强到 文件大小修改时间
(marginalia-mode t)

(package-install 'embark)

;;系统字段的C-x C-h  打开的help buffer 不能执行命令，只能看到什么快捷键绑了什么函数
;;embark的help 打开后 可以输入文本匹配命令，回车还能运行，不用记忆快捷键了。
(setq prefix-help-command 'embark-prefix-help-command)

(package-install 'consult)

(add-to-list 'process-coding-system-alist '("es" gbk . gbk))
(setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))


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


(package-install 'embark-consult)
(package-install 'wgrep)
(setq wgrep-auto-save-buffer t)

(eval-after-load 'consult
  '(eval-after-load 'embark
     '(progn
	(require 'embark-consult)
	(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))))

(provide 'init-completion)
