;;; site-lisp/cache-path-from-shell/cache-path-from-shell.el -*- lexical-binding: t; -*-

;;; make sure exec-path-from-shell only execute once in Emacs startup.

;; ;; Commentary:
;; ;; Original code, in case some errors appear
;; ;;; Require
;; (require 'exec-path-from-shell)

;; ;;; Code:

;; ;; We don't need warnings from `exec-path-from-shell'. ;)
;; (setq exec-path-from-shell-check-startup-files nil)

;; (defvar cache-path-from-shell-loaded-p nil)

;; (defadvice exec-path-from-shell-initialize (around cache-path-from-shell-advice activate)
;;   (if cache-path-from-shell-loaded-p
;;       (message "All shell environment variables has loaded in Emacs")
;;     (setq cache-path-from-shell-loaded-p t)
;;     ad-do-it))

;; (provide 'cache-path-from-shell)


;;; Require
(require 'exec-path-from-shell)

;; We don't need warnings from `exec-path-from-shell'. ;)
(setq exec-path-from-shell-check-startup-files nil)

(defcustom cache-path-from-shell-loaded-p nil
  "Flag to track whether shell environment variables have been loaded."
  :type 'boolean
  :group 'exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
  (defadvice exec-path-from-shell-initialize (around cache-path-from-shell-advice activate)
    (if cache-path-from-shell-loaded-p
        (message "All shell environment variables have been loaded in Emacs!")
      (setq cache-path-from-shell-loaded-p t)
      ad-do-it)))

(provide 'cache-path-from-shell)
;;; cache-path-from-shell.el ends here
