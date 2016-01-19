;; Language Hooks

;; shell-script-mode

;; Use shell-script-mode for .zsh files.

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; conf-mode

(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))


;; Web Mode

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

;; Ruby

;; Turn on autopair for Ruby. Identify additional file names/extensions that will trigger ruby-mode when loaded.

(add-hook 'ruby-mode-hook
          (lambda ()
            (autopair-mode)))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))


;; JavaScript Mode

;; js-mode defaults to using 4 spaces for indentation. Change it to 2

(defun js-custom ()
  "js-mode-hook"
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'js-custom)

;; Markdown Mode

;; Enable Markdown mode and setup additional file extensions. Use pandoc to generate HTML previews from within the mode, and use a custom css file to make it a little prettier.

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")
(setq markdown-css-paths `(,(expand-file-name "markdown.css" abedra/vendor-dir)))

(provide 'prelude-language-hook)
;; prelude-language-hook.el ends here.
