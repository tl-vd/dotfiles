(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(origami-show-fold-header nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal))))
 '(origami-fold-header-face ((t (:background "#073642" :box (:line-width 1 :color "#073642"))))))


(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("elpa" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; use-package
(require 'use-package)
;(setq use-package-always-ensure t)
(require 'bind-key) ;use-package's bind-key
;;(require 'diminish) ;use-package's diminish

;; Temporary package space
; (require 'load-dir)

(defvar config-dir (concat (getenv "HOME") "/emacs"))
(setq load-path (cons config-dir load-path))
;;(normal-top-level-add-subdirs-to-load-path)

;;(load-dir-one  (expand-file-name "~/emacs"))
(load-library "general")
(load-library "keys")
(load-library "color")
                                        ;(load-library "funcs")
(require 'funcs)

;; Packages' configs
(load-library "yasnippet-config")
(load-library "autocomplete-config")
;;(load-library "company-config")
(load-library "iedit-config")
(load-library "autopair-config")
(require 'flycheck-config) ;(load-library "flycheck-config")
(load-library "ido-config")
(load-library "cl-config")
;;(load-library "vimish-fold-config")
(load-library "origami-config")
;;(require 'paredit-config)
(require 'eshell-config)
;; Languages configs
(load-library "lang/c-common")
(load-library "lang/elisp")
(load-library "lang/rust")
