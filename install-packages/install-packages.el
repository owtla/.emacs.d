;;; install-packages.el --- Emacs Package Installation

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'package)

(defvar my-packages
  '(better-defaults
    cl-format
    cl-generic
    cyberpunk-theme
    elpy
    exec-path-from-shell
    flycheck
    git
    go-add-tags
    go-autocomplete
    go-eldoc
    go-guru
    go-mode
    js2-mode
    json-mode
    magit
    markdown-mode
    markdown-preview-mode
    osx-clipboard
    py-autopep8
    rainbow-delimiters
    seq
    smart-mode-line
    web-mode
    yaml-mode))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))


(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;; Turn off line numbers in terminals and other appropriate modes
(add-hook 'after-change-major-mode-hook
            '(lambda ()
               (linum-mode (if (or (equal major-mode 'ansi-mode) (equal major-mode 'eshell-mode) (equal major-mode 'term-mode) (equal major-mode 'help-mode) (equal major-mode 'text-mode)) 0 1))))

;;; install-packages.el ends here
