;; http://www.emacswiki.org/emacs/SshWithEmacs#toc4
;; ssh
(require 'ssh)
    (add-hook 'ssh-mode-hook
              (lambda ()
                (setq ssh-directory-tracking-mode t)
                (shell-dirtrack-mode t)
                (setq dirtrackp nil)))



;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



(provide 'prelude-mac)
;; prelude-mac.el ends here.
