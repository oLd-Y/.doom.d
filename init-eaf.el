;;; init-eaf.el -*- lexical-binding: t; -*-

;; eaf
(use-package! eaf
  :load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework"
  :custom
                                        ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  ;; have links opened within emacs using eaf-browser rather than the default browser
  ;; (browse-url-browser-function 'eaf-open-browser)
  :init
  (setq eaf-proxy-type "http")
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "7890")
  :config
  (defalias 'browse-web #'eaf-open-browser)
  )

(require 'eaf-browser)
(require 'eaf-pdf-viewer)

;; eaf-evil should be the last
(require 'eaf-evil)

(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  eaf-buffer-input-focus
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))

(provide 'init-eaf)
