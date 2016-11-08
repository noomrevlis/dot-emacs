
(setq evil-default-cursor t)

(evil-mode t)


(evil-leader/set-key
"p" 'jedi:goto-definition-pop-marker
"b" 'ido-switch-buffer
"w" 'switch-window
"x" 'er/expand-region
"l" 'linum-mode
"f" 'ido-find-file
;"j" 'ace-jump-mode
"j" 'avy-goto-char-2
"q" 'kill-this-buffer
"h" 'helm-projectile-find-file
"g" 'jedi:goto-definition
"e" 'helm-swoop
"d" 'dired-jump
"c" 'helm-find-files
"k" 'delete-trailing-whitespace
"s" 'helm-M-x
"a" 'helm-projectile-ag
"r" 'helm-resume
"m" 'helm-multi-swoop
)
(setq evil-leader/leader "SPC" evil-leader/in-all-states t)
(global-evil-leader-mode)

(define-key evil-normal-state-map (kbd "C-w +")  '(lambda () (interactive) (evil-window-increase-height 5)))
(define-key evil-normal-state-map (kbd "C-w -")  '(lambda () (interactive) (evil-window-decrease-height 5)))

(define-key evil-normal-state-map (kbd "C-w >")  '(lambda () (interactive) (evil-window-increase-width 5)))
(define-key evil-normal-state-map (kbd "C-w <")  '(lambda () (interactive) (evil-window-decrease-width 5)))

(define-key evil-normal-state-map (kbd "C-x C-a")  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x C-d")  'evil-numbers/dec-at-pt)


(provide 'init-evil)
