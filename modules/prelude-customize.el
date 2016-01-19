
;; auto pare
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


;; Splash Screen

;; I want to skip straight to the scratch buffer. This turns off the splash screen and puts me straight into the scratch buffer. I don't really care to have anything in there either, so turn off the message while we're at it. Since I end up using org-mode most of the time, set the default mode accordingly.

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; Scroll bar, Tool bar, Menu bar

;; Emacs starts up with way too much enabled. Turn off the scroll bar, menu bar, and tool bar. There isn't really a reason to have them on.

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Marking text

;; There are some behaviors in Emacs that aren't intuitive. Since I pair with others that don't know how Emacs handles highlighting, treat regions like other text editors. This means typing when the mark is active will write over the marked region. Also, make the common highlighting keystrokes work the way most people expect them to. This saves a lot of time explaining how to highlight areas of text. Emacs also has it's own clipboard and doesn't respond to the system clipboard by default, so tell Emacs that we're all friends and can get along.

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Display Settings

;; I have some modifications to the default display. First, a minor tweak to the frame title. It's also nice to be able to see when a file actually ends. This will put empty line markers into the left hand side.

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Indentation

;; There's nothing I dislike more than tabs in my files. Make sure I don't share that discomfort with others.

(setq tab-width 2
      indent-tabs-mode nil)

;; Backup files

;; Some people like to have them. I don't. Rather than pushing them to a folder, never to be used, just turn the whole thing off.

(setq make-backup-files nil)

;; Yes and No
;; Nobody likes to have to type out the full yes or no when Emacs asks. Which it does often. Make it one character.

(defalias 'yes-or-no-p 'y-or-n-p)


;; Misc

;; Turn down the time to echo keystrokes so I don't have to wait around for things to happen. Dialog boxes are also a bit annoying, so just have Emacs use the echo area for everything. Beeping is for robots, and I am not a robot. Use a visual indicator instead of making horrible noises. Oh, and always highlight parentheses. A person could go insane without that.

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; Themes

;; Load solarized-light if in a graphical environment. Load the wombat theme if in a terminal.

(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat t))

;; Color Codes

;; Running things like RSpec in compilation mode produces ansi color codes that aren't properly dealt with by default. This takes care of that and makes sure that the colors that are trying to be presented are rendered correctly.

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


(require 'cask)
;;cask-elpa-path

(provide 'prelude-customize)
;; prelude-customize.el ends here.
