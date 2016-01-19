(global-set-key (kbd "C-c SPC") 'ace-jump-mode)


(global-set-key (kbd "<f9>") 'ecb-activate)
(global-set-key [(control f9)] 'ecb-activate)

;; Key bindings

;; Miscellaneous key binding stuff that doesn't fit anywhere else.

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)


(provide 'prelude-keyboard)
;; prelude-keyboard.el ends here.
