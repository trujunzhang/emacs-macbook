
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(require 'ido)
(ido-mode t)

(require 'auto-complete-config)
(ac-config-default)


(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(require 'rvm)
(rvm-use-default)

(require 'autopair)

(defvar autopair-modes '(r-mode ruby-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(require 'paredit)
(defadvice paredit-mode (around disable-autopairs-around (arg))
  "Disable autopairs mode if paredit-mode is turned on"
  ad-do-it
  (if (null ad-return-value)
      (autopair-mode 1)
    (autopair-mode 0)
    ))

(ad-activate 'paredit-mode)

;;(require 'swift-mode-autoloads)
;; (require 'swift-mode)
;;(add-to-list 'flycheck-checker 'swift)




(provide 'prelude-customize)
;; prelude-customize.el ends here.
