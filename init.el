(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)


;; -*- coding: utf-8 -*-
(setq emacs-load-start-time (current-time))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;;----------------------------------------------------------------------------
;; Less GC, more memory
;;----------------------------------------------------------------------------
;; By default Emacs will initiate GC every 0.76 MB allocated
;; (gc-cons-threshold == 800000).
;; we increase this to 512MB
;; @see http://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
(setq-default gc-cons-threshold (* 1024 1024 512)
              gc-cons-percentage 0.5)



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
(defvar prelude-lisp-dir (expand-file-name  "lisp" prelude-dir)
  "This directory houses all of the built-in Prelude lisp.")
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
(add-to-list 'load-path prelude-lisp-dir)
;;(prelude-add-subfolders-to-load-path prelude-vendor-dir)


;; the core stuff
;;(require 'prelude-packages)
;;(require 'prelude-custom)  ;; Needs to be loaded before core, editor and ui
;;(require 'prelude-ui)
;;(require 'prelude-core)
;;(require 'prelude-mode)
;;(require 'prelude-editor)
;;(require 'prelude-global-keybindings)

;; Personal
(require 'exec-path-from-shell)

;; Modules
(require 'prelude-helm-everywhere)
(require 'prelude-project)
(require 'prelude-complete)
(require 'prelude-customize)
(require 'prelude-keyboard)
(require 'prelude-ido)
(require 'prelude-web)
(require 'prelude-speedbar)
(require 'prelude-complete)
(require 'prelude-math)
(require 'prelude-c)
(require 'prelude-mac)
(require 'prelude-org)
