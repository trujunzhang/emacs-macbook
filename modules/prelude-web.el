
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; Tern-powered Javascript integration
;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(add-hook 'js3-mode-hook (lambda () (tern-mode t)))
(add-hook 'js3-mode-hook (lambda () (auto-complete-mode t)))
(add-hook 'js3-mode-hook (lambda () (flyspell-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;;; add this key-map to /tern/emacs/tern.el
;;;(define-key tern-mode-keymap [(control tab)] 'completion-at-point)
(ac-flyspell-workaround)

;; scss-mode

(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; jade-mode(stylus)
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))


(provide 'prelude-web)
;; prelude-web.el ends here.
