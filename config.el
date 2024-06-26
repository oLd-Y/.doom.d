;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; (setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 16))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;



;; ;; make exec-path-from-shell from all elisp file execute only once.
;; ;; should be place at the first line of a custom emacs configuration.
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/cache-path-from-shell/"))
;; (require 'cache-path-from-shell)

(add-to-list 'load-path "~/")
(add-to-list 'load-path "~/.doom.d/")

(setq-default tab-width 4) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格

;; modify the width of treemacs window
(setq treemacs-width 40)

;; 设置全局代理
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
        ("http" . "127.0.0.1:7890")
        ("https" . "127.0.0.1:7890")))


(use-package! lsp-bridge
  :config
  (setq lsp-bridge-enable-log nil)
  (global-lsp-bridge-mode)
  ;; (add-hook 'org-mode-hook #'lsp-bridge-toggle-sdcv-helper)
  )


;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :init
  (setq copilot-indent-offset-warning-disable t)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  (setq global-copilot-mode t)
  )

;; ;; 防止 tab 键被 copilot 拦截
;; (after! (evil copilot)
;;   ;; Define the custom function that either accepts the completion or does the default behavior
;;   (defun my/copilot-tab-or-default ()
;;     (interactive)
;;     (if (and (bound-and-true-p copilot-mode)
;;             (copilot-has-suggestion-on-screen) ; HERE !!
;;              ;; Add any other conditions to check for active copilot suggestions if necessary
;;              )
;;         (copilot-accept-completion)
;;       (evil-insert 1))) ; Default action to insert a tab. Adjust as needed.

;;   ;; Bind the custom function to <tab> in Evil's insert state
;;   (evil-define-key 'insert 'global (kbd "<tab>") 'my/copilot-tab-or-default))


;; ;; eaf
;; (use-package! eaf
;;   :load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework"
;;   :custom
;;                                         ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   ;; have links opened within emacs using eaf-browser rather than the default browser
;;   ;; (browse-url-browser-function 'eaf-open-browser)
;;   :init
;;   (setq eaf-proxy-type "http")
;;   (setq eaf-proxy-host "127.0.0.1")
;;   (setq eaf-proxy-port "7890")
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)
;;   )

;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)
;; ;; (require 'eaf-pyqterminal)

;; ;; eaf-evil should be the last
;; (require 'eaf-evil)

;; (define-key key-translation-map (kbd "SPC")
;;     (lambda (prompt)
;;       (if (derived-mode-p 'eaf-mode)
;;           (pcase eaf--buffer-app-name
;;             ("browser" (if  eaf-buffer-input-focus
;;                            (kbd "SPC")
;;                          (kbd eaf-evil-leader-key)))
;;             ("pdf-viewer" (kbd eaf-evil-leader-key))
;;             ("image-viewer" (kbd eaf-evil-leader-key))
;;             (_  (kbd "SPC")))
;;         (kbd "SPC"))))


(setq system-time-locale "C")

;; ripgrep 编码问题
;; (add-to-list 'process-coding-system-alist
;;              '("[rR][gG]" . (utf-8-dos . windows-1251-dos)))
;;
;;

;; org-agenda
(after! org
  (setq org-agenda-files '("~/org/agenda.org")))


(require 'init-org)

;; sis
(use-package! sis
  :config
  ;; 配置输入法切换
  ;; 对于 Windows, 使用 'im-select
  (cond
   ((eq system-type 'windows-nt)  ; For Windows systems
    (sis-ism-lazyman-config
     "1033"  ; English input method id
     "2052"  ; Chinese input method id
     'im-select))

   ((eq system-type 'gnu/linux)   ; For Linux systems (including Ubuntu)
    (sis-ism-lazyman-config
     "1"
     "2"
     'fcitx5)))

  (setq sis-default-cursor-color "green yellow" ; 英文光标色
        sis-other-cursor-color "#FF2121"        ; 中文光标色
        ;; sis-inline-tighten-head-rule 'all ; 删除头部空格，默认1，删除一个空格，1/0/'all
        sis-inline-tighten-tail-rule 'all ; 删除尾部空格，默认1，删除一个空格，1/0/'all
        sis-inline-with-english t         ; 默认是t, 中文context下输入<spc>进入内联英文
        ;; sis-inline-with-other
        )
  ;; (sis-ism-lazyman-config nil "2052" 'im-select)
  ;; 启用 sis 的各种模式
  (sis-global-cursor-color-mode t)   ; 根据输入法状态改变光标颜色
  (sis-global-respect-mode t)        ; 在特定场景下保持英文状态
  (sis-global-context-mode t)        ; 根据上下文自动切换输入法
  (sis-global-inline-mode t)         ; 内联英文模式，输入英文时无需切换输入法
  )



;;(use-package! insert-translated-name
;;  :load-path "~/.doom.d/site-lisp/"
  ;;:config
 ;; (setq insert-translated-name-program "ollama")
  ;;)



;; ;; wraplish 自动在中英文交替之间的地方加入空格.
;; (use-package! wraplish
;;   :load-path "~/.doom./site-lisp/wraplish"
;;   :hook (markdown-mode . wraplish-mode)
;;         (org-mode . wraplish-mode))

;; 翻译弹窗软件
(use-package! popweb
  :load-path ("~/.doom.d/site-lisp/popweb"
              ;; "~/.doom.d/site-lisp/popweb/extension/org-roam"
              "~/.doom.d/site-lisp/popweb/extension/latex"
              "~/.doom.d/site-lisp/popweb/extension/dict"
              "~/.doom.d/site-lisp/popweb/extension/anki-review")
  :config
  ;; org-roam-link 就不要了, 因为它依赖 ivy, 它的 minibuffer 的目录补全不好用.
  ;; (require 'popweb-org-roam-link)
  (require 'popweb-latex)
  (require 'popweb-dict)
  (require 'popweb-anki-review)
  (add-hook 'latex-mode-hook #'popweb-latex-mode)

  ;; (setq popweb-proxy-type "http")
  ;; (setq popweb-proxy-host "127.0.0.1")
  ;; (setq popweb-proxy-port "7890")
  (setq popweb-url-web-window-width-scale 0.9)
  )

(require 'init-org)
(require 'init-evil)

;; emacs gui org-mode 表格中英文混杂时对齐
(use-package! valign
  :hook
  (org-mode . valign-mode)
  (markdown-mode . valign-mode)
  :config
  (setq valign-fancy-bar t))


(setq doom-font (font-spec :family "Maple Mono NF" :size 16))

(use-package! exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
    ;; (exec-path-from-shell-copy-env "NVM_DIR")
    ;; (exec-path-from-shell-copy-env "GPTEL_API_KEY")
    ))

(use-package! org-download
  :after org
  :custom
  ;; (org-download-image-dir "~/blog/static/")
  ;; (org-download-screenshot-method "scrot -s %s")
  (org-download-method 'attach)
  ;; (org-download-screenshot-file "~/tmp/screenshot.png")
  ;; (org-download-heading-lvl 1)
  )

(unless (string-equal system-type "windows-nt")
  ;; 在非 Windows 系统中启用 vterm
  (use-package! vterm
    ;; https://github.com/akermu/emacs-libvterm
    ;; 请务必参照项目 README 作配置，以下不是我的完整配置。
    ;; 比如，如果你要和 shell 双向互动（对，它可以双向互动），
    ;; 那么 shell 需要做一点配置以解析 vterm 传递过来的信号
    :config
    (setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=yes")
    (setq vterm-kill-buffer-on-exit t))) ;; shell 退出时 kill 掉这个 buffer



(use-package gptel
  :ensure t
  :config
  (setq gptel-api-key (getenv "GPTEL_API_KEY"))
  (setq gptel-model "moonshot-v1-8k")
  (setq gptel-default-mode 'org-mode)
  (setq gptel-backend
        (gptel-make-openai "Moonshot"
          :key 'gptel-api-key
          :models '("moonshot-v1-8k"
                    "moonshot-v1-32k"
                    "moonshot-v1-128k")
          :host "api.moonshot.cn")))

(use-package! dired
  :config
  (setq dired-omit-mode -1))

(use-package! leetcode
  :config
  (add-hook 'leetcode-solution-mode-hook
          (lambda() (flycheck-mode -1))))




(require 'init-evil)

(require 'init-treesit)

;; (require 'init-js)
(require 'init-window)
