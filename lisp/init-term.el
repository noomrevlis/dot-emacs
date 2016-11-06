
;; multi-term
(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  (term-send-raw-string "\C-k"))

(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (term-send-raw-string "\C-k"))

(setq multi-term-program "/bin/zsh")
(define-key global-map (kbd "C-x e") 'multi-term)
(setq term-unbind-key-list '("C-x" "<ESC>" "C-c" "C-h"))
(setq term-bind-key-alist
      '(("C-c" . term-interrupt-subjob)
        ("C-p" . term-send-up)
        ("C-h" . term-send-backspace)
        ("C-n" . term-send-down)
        ("C-s" . isearch-forward)
        ("C-r" . term-send-reverse-search-history)
        ("C-m" . term-send-raw)
        ("C-k" . term-send-kill-whole-line)
        ("C-y" . term-paste)
        ("C-_" . term-send-raw)
        ("M-DEL" . term-send-backward-kill-word)
        ("M-d" . term-send-forward-kill-word)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-K" . term-send-kill-line)
        ("M-p" . previous-line)
        ("M-n" . next-line)
        ("M-y" . yank-pop)
        ("M-," . term-send-input)
        ("M-." . term-send-raw-meta)))

(add-hook 'term-mode-hook
          (lambda ()
            (sublimity-mode -1)
            ;(evil-emacs-state 1)
            (setq show-trailing-whitespace nil) ;; turn off some minor mode under multi-term
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (setq term-buffer-maximum-size 10000)))


(setq multi-term-dedicated-select-after-open-p t)
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; utf8
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

(provide 'init-term)
