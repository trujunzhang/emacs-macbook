
(add-hook 'after-init-hook #'global-flycheck-mode)

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


;; yasnippet
(setq Version_Cask "24.5.1")
(setq Version_Yasnippet "20160104.129")


;; For example: 
(setq Yasnippet_snippets (concat "~/.emacs.d/.cask/" Version_Cask "/elpa/yasnippet-"  Version_Yasnippet  "/snippets"))

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
                                        ;"/Users/djzhang/.emacs.d/.cask/24.5.1/elpa/yasnippet-20160104.129/snippets"                    ;; foo-mode and bar-mode snippet collection
        Yasnippet_snippets
        ;;"/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ;;"/path/to/yasnippet/snippets"         ;; the default collection
        ))
;;(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; autocomplete
(ac-config-default)
;;(ac-set-trigger-key "<tab>")
;;(setq ac-auto-start nil)
;;(setq ac-auto-start nil)


;;(setq default-frame-alist
;;      '((height . 35) (width . 100) (menu-bar-line . 20)(tool-bar-lines . 0)))

;;(require 'swift-mode)
;;(add-to-list 'flycheck-checker 'swift)
;;(add-to-list 'auto-mode-alist '("\\.swift$" . swift-mode))


(set-face-attribute 'helm-selection nil 
                    :background "orange"
                    :foreground "black")


(provide 'prelude-customize)
;; prelude-customize.el ends here.
