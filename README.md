
C-h v 找到变量的describe
C-h m  每个类型的文件会有一个 major mode, 和n个 minor mode 的describe

C-h k 找快捷键的describe   C-x给系统 C-c给用户
M-x eval-buffer 执行当前缓冲区的所有lisp命令

M-.（即 Alt + .）命令来跳转到 配置文件 'init-basic 的定义


C-; embark-act  可以在当前上下文中显示一个可用命令的菜单。
举例1 C-h v 输入 compa prefi  光标移到company-minimum-prefix-length 按 C-; 再按c 就能set-variable
举例2 C-x C-h  展示了系统绑定的快捷键，输入文本 如 switch buffer 回车就直接运行了 by  embark-prefix-help-command
 
C-s  consult-line搜索
M-s i" 'consult-imenu  ;; 快速导航到当前缓冲区中定义的项（如函数、变量等）的命令

embark-consult 结合使用，以增强搜索和选择的体验。

M-x info 选择Emacs Lisp Intro