;;; init.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Version: 6.0.0
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/init.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'install-packages)
(require 'better-defaults)

(setq inhibit-startup-message t
      linum-format "%4d \u2502 "
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-startup-message t
      mac-command-modifier 'meta
      mac-option-modifier nil
      sml/no-confirm-load-theme t
      yas-global-mode 1
      custom-file "~/.emacs.d/custom.el"
      magit-auto-revert-mode 0
      magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)

(osx-clipboard-mode +1)

(global-linum-mode t)

;; modify ibuffer-formats to set name column wider
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) " " filename)
        (mark " "
              (name 16 -1) " " filename)))

(load-theme 'cyberpunk t)
(windmove-default-keybindings)
(defalias 'yes-or-no-p 'y-or-n-p)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

(sml/setup)
(add-to-list 'sml/replacer-regexp-list
             '("^~/go" ":go:") t)

(require 'development)

(load custom-file)

;;(defvar emacs_home (getenv "EMACS_HOME"))
;;(setq default-directory emacs_home)

;; Turn off line numbers for terminals and other modes
(add-hook 'after-change-major-mode-hook
          '(lambda ()
                   (linum-mode (if (or (equal major-mode 'ansi-mode)
                                       (equal major-mode 'custom-mode)
                                       (equal major-mode 'eshell-mode)
                                       (equal major-mode 'eww-mode)
                                       (equal major-mode 'help-mode)
                                       (equal major-mode 'shell-mode)
                                       (equal major-mode 'term-mode)
                                       (equal major-mode 'text-mode)
                                       ) 0 1))))

;;; init.el ends here
