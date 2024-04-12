;;; init-window.el -*- lexical-binding: t; -*-

(use-package winum
  :ensure t   ; 确保安装 winum 包
  :config
  ;; 在 winum 模式启动时绑定快捷键
  )

;; (global-set-key (kbd "M-0") 'winum-select-window-0-or-10)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)
(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-0") 'treemacs-select-window)


(provide 'init-window)
