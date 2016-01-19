(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)


;; ==================================================
;;                 Prelude settings
;; ==================================================
;; Always load newest byte code
(setq load-prefer-newer t)

(defvar prelude-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Prelude distribution.")
(defvar prelude-core-dir (expand-file-name "core" prelude-dir)
  "The home of Prelude's core functionality.")
(defvar prelude-modules-dir (expand-file-name  "modules" prelude-dir)
  "This directory houses all of the built-in Prelude modules.")
(defvar prelude-personal-dir (expand-file-name "personal" prelude-dir)
  "This directory is for your personal configuration.
Users of Emacs Prelude are encouraged to keep their personal configuration
changes in this directory.  All Emacs Lisp files there are loaded automatically
by Prelude.")



(defun prelude-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))q
	  (let ((name (expand-file-name f parent-dir)))
	    (when (and (file-directory-p name)
		       (not (string-prefix-p "." f)))
	      (add-to-list 'load-path name)
	      (prelude-add-subfolders-to-load-path name)))))

;; add Prelude's directories to Emacs's `load-path'
(add-to-list 'load-path prelude-core-dir)
(add-to-list 'load-path prelude-modules-dir)
;; (add-to-list 'load-path Prelude-personal-dir)
(add-to-list 'load-path prelude-personal-dir)
;;1q(prelude-add-subfolders-to-load-path prelude-vendor-dir)


;; the core stuff
;;(require 'prelude-packages)
;;(require 'prelude-custom)  ;; Needs to be loaded before core, editor and ui
;;(require 'prelude-ui)
;;(require 'prelude-core)
;;(require 'prelude-mode)
;;(require 'prelude-editor)
;;(require 'prelude-global-keybindings)

(require 'prelude-helm-everywhere)
(require 'prelude-customize)
(require 'prelude-keyboard)
(require 'prelude-ido)
(require 'prelude-web)
(require 'prelude-speedbar)
(require 'prelude-complete)
(require 'prelude-math)
(require 'prelude-c)
(require 'prelude-mac)


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

;; ==================================================
;;                 Basic Settings
;; ==================================================

(push "/usr/local/bin" exec-path)
(global-visual-line-mode t)
(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-indent-mode t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(when (window-system)
  (tooltip-mode -1)
  (set-fringe-style -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(global-auto-revert-mode 1)
(setq ring-bell-function 'ignore)

;; SAVEPLACE
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)

(electric-pair-mode t)

(defun save-all()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

;; indenting
(setq js-indent-level 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)

;; ==================================================
;;                 Appearence
;; ==================================================
(load-theme 'zenburn t)
(set-cursor-color "firebrick")

;; (load-theme 'peacock)
;; (set-frame-font "Source Code Pro-14")

;; ==================================================
;;                 Packages
;; ==================================================

;; web-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

;; avy
(avy-setup-default)
(global-set-key (kbd "M-C-;") 'avy-goto-char)
(global-set-key (kbd "M-;") 'avy-goto-word-1)

;; expand-region
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "M-o") 'change-inner)

;; projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; projectile and neotree
(setq projectile-switch-project-action 'neotree-projectile-action)

;; discover
(global-discover-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)


;; multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; neo-tree
(global-set-key (kbd "M-\\") 'neotree-toggle)
