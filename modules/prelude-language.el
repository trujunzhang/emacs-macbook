
(require 'cc-mode)

(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
;; replace C-S-<return> with a key binding that you want

;;(require 'member-functions)
;;(setq mf--source-file-extension "cpp")


;;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)


;; To set the layout for ECB, add this to your .emacs

(setq ecb-layout-name "layout-name")

;; Replace layout-name with the name of the layout you want. For a list of ECB layouts, follow this link ECB Layouts.

;; Show source files in directories buffer

(setq ecb-show-sources-in-directories-buffer 'always)
;;By default, ECB hides the compilation window. Everytime I compile, it displays the compilation message to the same window as the buffer that I’m editing. This is really annoying because I want to see all the messages so that I can fix the error in my code easily. To keep a persistent compile window in ECB, add this to your .emacs

(setq ecb-compile-window-height 12)

;;Some key bindings for quick interation with ECB, replace them with the key bindings that you want.

;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)



;; Some of My Functions
;; Personally, I don’t like those function ecb-deactivate, ecb-show-ecb-windows, ecb-hide-ecb-windows since I usually have to open multiple windows in Emacs. When deactivate or hide ECB window, it does not automatically restore the window layout and switch to the buffer that I’m editing. Similar problem happens when I try to show ecb window again. Because of that, I wrote those functions to replace the ECB built in three functions ecb-deactivate, ecb-show-ecb-windows, ecb-hide-ecb-windows.

;;; replacement for built-in ecb-deactive, ecb-hide-ecb-windows and
;;; ecb-show-ecb-windows functions
;;; since they hide/deactive ecb but not restore the old windows for me
(defun tmtxt/ecb-deactivate ()
  "deactive ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-deactivate)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-hide-ecb-windows ()
  "hide ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-hide-ecb-windows)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-show-ecb-windows ()
  "show ecb windows and then delete all other windows except the current one"
  (interactive)
  (ecb-show-ecb-windows)
  (delete-other-windows))

;; After that, bind them with a key sequence for quick interaction with ECB

(global-set-key (kbd "C-x C-'") 'tmtxt/ecb-deactivate)
(global-set-key (kbd "C-;") 'tmtxt/ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'tmtxt/ecb-hide-ecb-windows)


(provide 'prelude-language)
;; prelude-language.el ends here.
