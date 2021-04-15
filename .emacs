;; Initialize MELPA package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Custom option setup
(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(package-selected-packages '(robot-mode))
 '(show-paren-mode t))
(custom-set-faces
)
