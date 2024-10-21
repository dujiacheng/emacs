
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

embark-consult 结合使用，以增强搜索和选择的体验。  比如在批量替换的时候
1. 文件夹替换
C-c C-f 进入到文件夹, 
M-x consult-ripgrep , 输入要查找的 比如 hello , 
C-c C-e  Exported grep result
M-x query-replace   hello ->  hello2   按y 同意替换
C-c C-c 执行替换  



2. 当前buffer替换
C-s or S-s 
C-c C-e  Exported grep result
M-x query-replace   hello ->  hello2   按y 同意替换
C-c C-c 执行替换  

全局搜索
M-x consult-locat  运行 es, 需要安装everything  不能是绿色版  可以用正则 .txt\b#READ   C-; embark-act  再按x可以用外部程序打开

M-x info 选择Emacs Lisp Intro

M-x  customize-group       awesome-tab  进行变量设置，也能 看到有哪些变量 设置完 会保存在custom.el
global-auto-revert-mode   把外部磁盘修改的内容加到 emacs中
s-p  toggle-chinese-search 中文搜索

多行操作 

全选
S-a   
M-x mc/edit-lines  
C-a  C-e  

选位置
mc/mark-next-like-this

选单词 字符
mc/mark-next-like-this-word
mc/mark-next-like-this-symbol

doom-line 
M-x nerd-icons-install-fonts 
安装完之后 .emacs.d 下会有一个 NFM ，要在windows上手动右键安装