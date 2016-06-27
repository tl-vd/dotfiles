;(require 'cl)
;(require 'origami)
;
;;(define-key origami-mode-map "\C-\`" 'origami-forward-toggle-node)
;
;(global-set-key "\M-z" 'origami-forward-toggle-node)

(use-package origami
  :init
  (require 'cl)
  :config
  (global-set-key "\M-z" 'origami-forward-toggle-node))

(provide 'origami-config)
