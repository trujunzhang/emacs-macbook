

(speedbar 1)


(when window-system          ; start speedbar if we're using a window system
  (speedbar t))


 (setq speedbar-mode-hook '(lambda ()
    (interactive)
    (other-frame 0)))


(speedbar-add-supported-extension ".js")


(require 'projectile-speedbar)



(provide 'prelude-speedbar)
;; prelude-speedbar.el ends here.
