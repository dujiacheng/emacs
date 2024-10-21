(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tab-active-bar-height 55)
 '(awesome-tab-dark-active-bar-color nil)
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" default))
 '(package-selected-packages
   '(benchmark-init youdao-dictionary org-roam-ui gnu-elpa-keyring-update corfu fanyi org-roam org-download flyspell-correct tab-bar-mode doom-modeline resize-window buffer-move es-windows window-numbering yasnippet-snippets yasnippet treesit-auto highlight-global quelpa-use-package quelpa symbol-overlay expand-region evil-multiedit iedit evil-matchit evil-snipe evil-nerd-commenter evil-surround evil-collection evil-anzu general undo-tree quickrun ox-hugo org-contrib org restart-emacs evil use-package doom-themes doom-theme doom-one popper magit monokai-theme monoka monokai pyim wgrep embark-consult cosult consult embark orderless marginalia maginalia vertico keycast))
 '(package-vc-selected-packages
   '((org-roam-ui :vc-backend Git :url "https://www.github.com/org-roam/org-roam-ui")))
 '(safe-local-variable-values
   '((eval and buffer-file-name
	   (not
	    (eq major-mode 'package-recipe-mode))
	   (or
	    (require 'package-recipe-mode nil t)
	    (let
		((load-path
		  (cons "../package-build" load-path)))
	      (require 'package-recipe-mode nil t)))
	   (package-recipe-mode))))
 '(tab-bar-auto-width-max '(400 20)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:height 0.9))))
 '(tab-bar ((t (:inherit mode-line))))
 '(tab-bar-tab ((t (:inherit mode-line :foreground "#999944"))))
 '(tab-bar-tab-inactive ((t (:inherit mode-line-inactive :foreground "white")))))
