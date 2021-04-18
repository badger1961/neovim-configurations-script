;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize MELPA package repositories
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; System-type definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start Emacs as a server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (system-is-linux)
    (message "We are in Linux")
    (require 'server)
    (unless (server-running-p)
      (server-start)))
(when (system-is-windows)
    (message "We are in Windows"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My name and e-mail adress
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name   "%user-name%")
(setq user-mail-adress "%user-mail%")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Option Customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(show-paren-mode t))
(custom-set-faces)
