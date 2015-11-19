(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; auto-complete-c-headers
;; TODO: move this to c-mode config?
(defun ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-hook 'ac-c-header-init)
(add-hook 'c++-mode-hook 'ac-c-header-init)
