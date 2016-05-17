;(global-linum-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode 0)
(setq scroll-step 3)
;(which-function-mode 1)
(show-paren-mode 1)
;(electric-pair-mode 1)
(setq-default indent-tabs-mode nil)
(global-prettify-symbols-mode 1)

;; Backups
(setq backup-directory-alist '(("." . "~/emacs/.backup"))
      ;auto-save-file-name-transforms '((".*" temporary-file-directory t))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(fset 'yes-or-no-p 'y-or-n-p) ;; (yes/no) -> (y/n)

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(add-hook 'emacs-startup-hook 'eshell)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't bother special buffers
