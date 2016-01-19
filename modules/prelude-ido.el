
;; Ido

;; Ido mode provides a nice way to navigate the filesystem. This is mostly just turning it on.

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Column number mode

;; Turn on column numbers.

(setq column-number-mode t)


(provide 'prelude-ido)
;; prelude-ido.el ends here.