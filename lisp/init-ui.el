(global-display-line-numbers-mode 1)

(setq inhibit-startup-screen t)


;;(toggle-frame-maximized)


;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)



(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default cursor-type '(bar . 5))
 (global-hl-line-mode 1)

;;(use-package monokai-theme)
;;(load-theme 'monokai 1)
(use-package doom-themes)
(load-theme 'doom-one 1)

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(run-at-time "5 sec" nil
  (lambda ()
    (require 'use-package)
    (use-package doom-modeline
      :ensure t
      :custom-face
      (mode-line ((t (:height 0.9))))
      (mode-line-inactive ((t (:height 0.9))))
      :init
      (doom-modeline-mode t))))



(provide 'init-ui)
