;;************************************************************
;; Version A400
;;************************************************************
;; ***********************************************************
;; Local Functions
;;************************************************************
;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))
(defun format-current-buffer()
    (indent-region (point-min) (point-max)))
(defun untabify-current-buffer()
    (if (not indent-tabs-mode)
        (untabify (point-min) (point-max)))
    nil)
;; Third party package initialization
;;***********************************************************
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) 
;;*******************************************************
;; Start Emacs as a server
;;******************************************************
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start))) ;; запустить Emacs как сервер, если ОС - GNU/Linux
;;*********************************************
;; Interface customization
;; *******************************************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(package-selected-packages
   (quote
	(clang-format+ clang-format cmake-ide cmake-mode flycheck magit py-autopep8 elpygen elpy)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq-default tab-width          4)
(setq-default c-basic-offset     4)
(setq-default standart-indent    4)
(setq scroll-step            1
      scroll-conservatively  10000)
;;******************************************************************
;; File operation customization
;;*****************************************************************
(require 'dired)
(setq dired-recursive-deletes 'top) ;;user is able remove not empty folder
;;*******************************************************************
;; User Credential
;;*******************************************************************
(setq user-full-name   "%user-name%")
(setq user-mail-adress "alexander.l.gorlov@gmail.com")
;;***************************************************************
;; GUI Setup
;;**************************************************************
;; Line number setup
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format " %d")
;; Buffer Title
(setq frame-title-format "GNU Emacs: %b")
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)
;;************************************************************
;;Searching customization
;;***********************************************************
;; Highlight search resaults

(setq search-highlight        t)
(setq query-replace-highlight t)
;;*************************************************************
;; Text Edition Mode
;;************************************************************
(electric-pair-mode    1) ;; add close {},[],()
(setq-default indicate-empty-lines t)
(delete-selection-mode t)
;;(add-to-list 'write-file-functions 'format-current-buffer)
;;(add-to-list 'write-file-functions 'untabify-current-buffer)
;;(add-to-list 'write-file-functions 'delete-trailing-whitespace)
;; Bookmark settings
(require 'bookmark)
(setq bookmark-save-flag t)
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
  (bookmark-load bookmark-default-file t))
(global-set-key (kbd "<f2>")  'save-buffer)
(global-set-key (kbd "<f3>")  'bookmark-set) 
(global-set-key (kbd "<f4>")  'bookmark-jump)
(global-set-key (kbd "<f5>")  'bookmark-bmenu-list)
(global-set-key (kbd "<f12>") 'comint-clear-buffer)
(setq bookmark-default-file (concat user-emacs-directory "bookmarks"))
;;******************************************************************
;; Programm Edition Configuration
;;******************************************************************
(setq c-default-style
      '((java-mode . "java") (other . "linux")))
;; auto format
(add-hook 'c-mode-common-hook #'clang-format+-mode)
;;******************************************************************
;; CEDET Configuration
;;******************************************************************
(require 'cedet)
'(global-semantic-idle-scheduler-mode global-semanticdb-minor-mode)
(setq semantic-default-submodes
      '(;; Perform semantic actions during idle time
        global-semantic-idle-scheduler-mode
        ;; Use a database of parsed tags
        global-semanticdb-minor-mode
        ;; Decorate buffers with additional semantic information
        global-semantic-decoration-mode
        ;; Highlight the name of the function you're currently in
        global-semantic-highlight-func-mode
        ;; show the name of the function at the top in a sticky
        global-semantic-stickyfunc-mode
        ;; Generate a summary of the current tag when idle
        global-semantic-idle-summary-mode
        ;; Show a breadcrumb of location during idle time
        global-semantic-idle-breadcrumbs-mode
        ;; Switch to recently changed tags with `semantic-mrub-switch-tags',
        ;; or `C-x B'
        global-semantic-mru-bookmark-mode))
(add-hook 'emacs-lisp-mode-hook 'semantic-mode)
(add-hook 'python-mode-hook 'semantic-mode)
(add-hook 'c-mode-hook 'semantic-mode)
;;*****************************************************************
;; shell configuration
;;****************************************************************
(global-set-key (kbd "<f6>") 'shell)
