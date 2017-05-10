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

;;; install-packages.el ends here
