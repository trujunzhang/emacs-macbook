
;; ==================================================
;;                 HELM mode settings
;; ==================================================
(require 'helm-config)

(setq make-backup-files nil)

;; Change C-x with C-n and C-c with C-i on Colemak layout
;; (keyboard-translate ?\C-n ?\C-x)
;; (keyboard-translate ?\C-x ?\C-n)
;; (keyboard-translate ?\C-i ?\C-c)
;; (keyboard-translate ?\C-c ?\C-i)

;; Cursor keys on home row
(global-set-key (kbd "M-e") 'next-line)
(global-set-key (kbd "M-u") 'previous-line)
(global-set-key (kbd "M-n") 'backward-char)
(global-set-key (kbd "M-i") 'forward-char)

(projectile-global-mode)

(set-face-attribute 'helm-selection nil
                    :background "orange"
                    :foreground "black")

(provide 'prelude-project)
;; prelude-project.el ends here.
