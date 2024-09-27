;;行号
(global-linum-mode 1)
;; 启动时将不会显示欢迎页面
(setq inhibit-startup-screen t) 


;;最大化或恢复当前窗口
;;(toggle-frame-maximized)


;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)


;;关闭工具栏和滚动条
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; 光标样式
(setq-default cursor-type '(bar . 5))


;; 全局高亮当前行
(global-hl-line-mode 1)

;;doom 的ui 皮肤
(package-install 'doom-themes)
(load-theme 'doom-one 1)

(provide 'init-ui)
