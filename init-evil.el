;;; init-evil.el -*- lexical-binding: t; -*-

(use-package evil-mc
  :diminish
  :hook (after-init . global-evil-mc-mode)
  :init
  (defvar evil-mc-key-map (make-sparse-keymap))
  :config
  (defhydra hydra-evil-mc (:color blue :hint nil)
    "
 _C-a_  all match          _m_ here                _u_ undo
 _n_    next match         _J_ mark & move next    _s_ suspend
 _p_    prev match         _K_ mark & move prev    _r_ resume
 _N_    skip & next match  _H_ first cursor        _q_ quit
 _P_    skip & prev match  _L_ last cursor         _O_ quit
    "
    ("m" evil-mc-make-cursor-here :exit nil)
    ("C-a" evil-mc-make-all-cursors :exit nil)
    ("n" evil-mc-make-and-goto-next-match :exit nil)
    ("p" evil-mc-make-and-goto-prev-match :exit nil)
    ("N" evil-mc-skip-and-goto-next-match :exit nil)
    ("P" evil-mc-skip-and-goto-prev-match :exit nil)

    ("j" evil-next-line :exit nil)
    ("k" evil-previous-line :exit nil)
    ("J" evil-mc-make-cursor-move-next-line :exit nil)
    ("K" evil-mc-make-cursor-move-prev-line :exit nil)

    ("H" evil-mc-make-and-goto-first-cursor :exit nil)
    ("L" evil-mc-make-and-goto-last-cursor :exit nil)
    ("u" evil-mc-undo-last-added-cursor :exit nil)
    ("r" evil-mc-resume-cursors)
    ("s" evil-mc-pause-cursors)
    ("O" evil-mc-undo-all-cursors)
    ("q" evil-mc-undo-all-cursors))

  ;; (evil-define-key* '(normal visual) 'global
  ;;   (kbd "SPC-j") 'hydra-evil-mc/body)

  ;; (evil-define-key* 'visual evil-mc-key-map
  ;;   "A" 'evil-mc-make-cursor-in-visual-selection-end
  ;;   "I" 'evil-mc-make-cursor-in-visual-selection-beg))

  (map! :leader
      :desc "Evil-mc Hydra"
      "j" #'hydra-evil-mc/body)

  (map! :map evil-mc-key-map
      :v "A" #'evil-mc-make-cursor-in-visual-selection-end
      :v "I" #'evil-mc-make-cursor-in-visual-selection-beg))

(provide 'init-evil)
;;; init-evil.el ends here.
