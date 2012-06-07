
;; auto-install.el
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-set-window-plain)

(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file)

(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")

(global-set-key "\C-m" 'newline-and-indent)

(find-function-setup-keys)

;;; other plugins
;;; magit
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'magit)
(require 'magit-svn)
(setq magit-repo-dirs nil)

;;; tramp
(require 'tramp)
(setq tramp-default-method "scp")

;;; my c mode
(defun my-c-mode-hook ()
  ;; add my personal style and set it for the current buffer 
  (c-set-style "gnu") 
  ;; offset customizations not in my-c-style 
  (c-set-offset 'member-init-intro '++) 
  ;; other customizations 
  (setq tab-width 8 
	;; this will make sure spaces are used instead of tabs 
	indent-tabs-mode nil) 
  (setq c-tab-always-indent nil)
  ;; we like auto-newline and hungry-delete 
  (c-toggle-auto-hungry-state 1) 
  (font-lock-mode 2) 
  ;; keybindings for all supported languages.  We can put these in 
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map, 
  ;; java-mode-map, and idl-mode-map inherit from it. 
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  ;; add an index of C program buffer on menubar.
  (imenu-add-menubar-index)
  ;; show which function you are in.
  (which-func-mode)
  ) 

(add-hook 'c-mode-hook 'my-c-mode-hook) 

;;; my linux c mode
(defun my-linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

(setq auto-mode-alist (cons '("/usr/src/linux.*/.*\\.[ch]$" . my-linux-c-mode)
			    auto-mode-alist))

;;; my c++ mode
(defun my-c++-mode-hook ()
  ;; add my personal style and set it for the current buffer 
  (c-set-style "stroustrup") 
  ;; offset customizations not in my-c-style 
  (c-set-offset 'member-init-intro '++) 
  ;; other customizations 
  (setq tab-width 8 
	;; this will make sure spaces are used instead of tabs 
	indent-tabs-mode nil)
  (setq c-tab-always-indent nil)
  ;; we like auto-newline and hungry-delete 
  (c-toggle-auto-hungry-state 1) 
  (font-lock-mode 2) 
  ;; keybindings for all supported languages.  We can put these in 
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map, 
  ;; java-mode-map, and idl-mode-map inherit from it. 
  (define-key c-mode-base-map "\C-m" 'newline-and-indent) 
  ;; add an index of C program buffer on menubar.
  (imenu-add-menubar-index)
  ;; show which function you are in.
  (which-function-mode)
  ) 

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; python
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; php mode
(require 'php-mode)

;; For default major mode
(setq default-major-mode 'text-mode)
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; For file recognition
(setq-default transient-mark-mode t)
(setq auto-mode-alist (cons '("\\.C$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cc$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.c$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hh$" . c++-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.hxx$" . c++-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.H$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.java$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.asm$" . asm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sh$" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.y$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.lex$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.l$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))

;; Make control PgUp/PgDn scroll the other buffer
(global-set-key [C-next] 'scroll-other-window)
(global-set-key [C-prior] 'scroll-other-window-down)

;; Some other key binding
(global-set-key [f1] 'man)
(global-set-key [f2] 'mark-whole-buffer)
(global-set-key [f3] 'switch-to-buffer)
(global-set-key [f4] 'kill-buffer)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'first-error)
(global-set-key [f7] 'next-error)
(global-set-key [f8] 'which-func-mode)
(global-set-key [f9] 'goto-line)
(global-set-key [S-f1] 'calendar)
(global-set-key [S-f2] 'comment-region)
(global-set-key [S-f3] 'bookmark-set)
(global-set-key [S-f4] 'bookmark-jump)
(global-set-key [S-f5] 'gdb)
(global-set-key [S-f6] 'ispell-buffer)
(global-set-key [S-f7] 'eshell)
(global-set-key [S-f8] 'magit-status)

;; Rebind Ctrl-z to start a new shell
(global-set-key "\C-z" 'eshell)

;; Gnus shortcut
(global-set-key "\M-n" 'gnus)

;; About hiding the passwds
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; Some variables
(setq make-backup-file nil)
(setq search-highlight t)
(setq scroll-step 1)
(setq column-number-mode t)

;; For LaTeXe
(setq TeX-auto-sace t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq LaTeX-section-hook
      '(LaTeX-section-heading
	LaTeX-section-title
	LaTeX-section-toc
	LaTeX-section-section
	LaTeX-section-label))

;; Require a newline char at the end of files.
(setq require-final-newline t)

;; When using manpages, jump to man buffer.
(setq Man-notify-method 'pushy)

;; Save your bookmark when setting one, otherwise save when exit emacs.
(setq bookmark-save-flag 1)

;; Tex dvi viewer
(setq tex-dvi-view-command "xdvi")

;; Compile command
(setq compile-command "make -j8")

;; Language environment
(set-language-environment 'Chinese-GB)
(set-buffer-file-coding-system 'cn-gb-2312)
(set-keyboard-coding-system 'cn-gb-2312)
(set-terminal-coding-system 'cn-gb-2312)
(setq-default enable-multibyte-charecters t)
(prefer-coding-system 'cn-gb-2312)
(set-selection-coding-system 'cn-gb-2312)

;; Sth about time displaying
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(display-time)

;; Images
(auto-image-file-mode)

(menu-bar-mode 1)
(tool-bar-mode 1)

;; Sth about parentheses
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; Backup
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/var/tmp")))
(setq backup-by-coping t)

;; Syntax highlighting
(global-font-lock-mode t)
(setq font-lock-verbose t)

;; Things about email and usenet
(setq rmail-file-name "~/mbox")

;; My diary.
(setq chinese-calendar-celestial-stem
      ["¼×" "ÒÒ" "±û" "¶¡" "Îì" "¼º" "¸ý" "ÐÁ" "ÈÉ" "¹ï"])
(setq chinese-calendar-terrestrial-branch
      ["×Ó" "³ó" "Òú" "Ã®" "³½" "ËÈ" "Îç" "Î´" "Éê" "ÓÏ" "Ðç" "º¥"])

;; Extract compressed files
(auto-compression-mode 1)

;; Get rid of the error bell sound.
(setq visible-bell t)

;; Get rid of mouse around me!
(mouse-avoidance-mode 'animate)

;; Diary.
(setq diary-file "~/diary")

;; Modified by pAnk7.yArdbird. Enable color support of ls for shell-mode.
(defun my-shell-mode-hook ()
  (load-library "ansi-color")
  (ansi-color-for-comint-mode-on)
  )

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(load "desktop")
(desktop-load-default)
(desktop-read)

(global-set-key "\M- " 'hippie-expand)
(setq hippie-expand-try-function-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

'(browse-url-mozilla-program "chrome")

;; ido
;;(require 'ido)
;;(ido-mode t)
;;(global-set-key (kbd "C-x f") 'find-file-at-point)

;; PC selection mode
;; (setq pc-selection-mode t)

;; ibuffer
;;(require 'ibuffer)
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

;; color theme
(require 'color-theme)
;;(color-theme-classic)
;;(color-theme-lawrence)
(color-theme-euphoria)
;;(color-theme-oswald)
;;(color-theme-dark-laptop)
;;(color-theme-matrix)
;;(color-theme-xp)
;;(set-face-font 'menu "7x14")
;;(set-face-foreground 'menu "white")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default
    ((t (:inherit nil :stipple nil :background "black" :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Courier_New")))))
