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
;;(ac-config-default)
;;(ac-set-trigger-key "<tab>")
;;(setq ac-auto-start nil)
;;(setq ac-auto-start nil)


;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(provide 'prelude-complete)
;; prelude-complete.el ends here.
