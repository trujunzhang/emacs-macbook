
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


;; super-save auto-saves your buffers, when certain events happen - e.g.
;; you switch between buffers, an Emacs frame loses focus, etc.
;; You can think of it as both something that augments and replaces the standard auto-save-mode.
;;  (super-save-initialize)

;;(setq default-frame-alist
;;      '((height . 35) (width . 100) (menu-bar-line . 20)(tool-bar-lines . 0)))

;;(require 'swift-mode-autoloads)
(require 'swift-mode)
;;(add-to-list 'flycheck-checker 'swift)

(set-face-attribute 'helm-selection nil 
                    :background "orange"
                    :foreground "black")


(provide 'prelude-customize)
;; prelude-customize.el ends here.
