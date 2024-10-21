

(setq inhibit-startup-screen t)

;;(toggle-frame-maximized)



(use-package doom-themes
  :defer t)

(run-with-idle-timer 20 nil
  (lambda ()
    (load-theme 'doom-one t)))


;;(use-package nerd-icons  )
(run-at-time "7 sec" nil (lambda () (use-package nerd-icons )))


(run-with-idle-timer 13 nil
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
