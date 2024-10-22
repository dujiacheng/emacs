;; -*- lexical-binding: t -*-

;; 启动时设置较大的垃圾回收阈值
(setq gc-cons-threshold (* 500 1000 1000))

;; 启动后恢复到一个较合理的阈值，例如 20MB
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 50 1000 1000))))



(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-basic)
(require 'init-funcs)

(require 'init-packages)

(use-package benchmark-init
  :ensure t
  :demand t
  :config
  ;; To disable collection of benchmark data after init is done.
 ;; (add-hook 'after-init-hook 'benchmark-init/deactivate)
  )
(require 'init-ui)

;;(require 'init-evil)
(run-at-time "3 sec" nil (lambda () (require 'init-evil)))


;;(require 'init-completion)
(run-at-time "10 sec" nil (lambda () (require 'init-completion)))

(require 'init-tools)
;;(run-at-time "10 sec" nil (lambda () (require 'init-tools)))




(require 'init-org)
;;(run-at-time "4 sec" nil (lambda () (require 'init-org)))

;;(require 'init-keybindings)
(run-at-time "4 sec" nil (lambda () (require 'init-keybindings)))

;;(require 'init-programming)
(run-at-time "10 sec" nil (lambda () (require 'init-programming)))


;;(require 'init-window)
(run-at-time "11 sec" nil (lambda () (require 'init-window)))

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)


(setq gc-cons-threshold (* 2 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-vc-selected-packages
   '((org-roam-ui :vc-backend Git :url "https://www.github.com/org-roam/org-roam-ui"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

