;(add-to-list 'custom-theme-load-path (concat config-dir "/themes/solarized-gray"))
;(add-to-list 'custom-theme-load-path (concat config-dir "/themes/s3r0"))
(add-to-list 'custom-theme-load-path (concat config-dir "/themes/emacs-color-theme-solarized"))
(load-theme 'solarized t)
(add-hook 'after-make-frame-functions
 	  (set-frame-parameter nil 'background-mode 'dark)
	  (set-terminal-parameter nil 'background-mode 'dark)
	  (enable-theme 'solarized)
	  )
;;(add-hook 'window-setup-hook
;;	  (set-background-color "#1A1919")
;;	  (set-foreground-color "#BAB6B1")
;;	  ;;(set-cursor-color "#40FF40")
;;	  )

(provide 'color)
