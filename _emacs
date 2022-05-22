;; Define the init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Rebind Ctrl-z to start a new shell
(global-set-key "\C-z" 'eshell)

(load-theme 'solarized-dark t)

;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(auto-image-file-mode)

;;; Language environment
;; (set-language-environment 'Chinese-GB)
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq-default enable-multibyte-charecters t)
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Sth about time displaying
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(display-time)

;;(require 'open-junk-file)
;;(global-set-key (kbd "C-x C-z") 'open-junk-file)

(global-set-key "\C-m" 'newline-and-indent)

;; Some variables
(setq make-backup-file nil)
(setq search-highlight t)
(setq scroll-step 1)
(setq column-number-mode t)
(setq default-major-mode 'text-mode)
(setq indent-tabs-mode nil)

;; Require a newline char at the end of files.
(setq require-final-newline t)

;; Backup
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/var/tmp")))
(setq backup-by-coping t)

;; Get rid of the error bell sound.
(setq visible-bell t)

;; Get rid of mouse around me!
(mouse-avoidance-mode 'animate)

(load "desktop")
;;(desktop-load-default)
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


;;(make-directory "~/.org-jira")
;;(setq jiralib-url "https://bugs.indeed.com")

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

;;; org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "courier")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 160)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;; (set-fontset-font t 'hangul (font-spec :name "courier"))

  ;; you may want to add different for other charset in this way.
  )
