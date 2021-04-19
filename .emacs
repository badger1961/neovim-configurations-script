;;************************************************************
;; Version A0100 
;;************************************************************
;; ***********************************************************
;; Local Functions
;;************************************************************
;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))
;; Third party package initialization
;;***********************************************************
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
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
 '(package-selected-packages '(flycheck magit py-autopep8 elpygen elpy))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(tab-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces)
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
;;*************************************************************
;; Text Edition Mode
;;************************************************************
(electric-pair-mode    1) ;; add close {},[],()
(setq-default indicate-empty-lines t) 
