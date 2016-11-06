; dired
(require 'dired-x)
;(setq dired-omit-files "^\\.pdf$\\|\\.git$\\|\\.DS_Store$")
(setq dired-omit-files "\\.DS_Store$")
(setq dired-omit-extensions (append '(".pyc" ".pyo") dired-omit-extensions))
(setq dired-recursive-deletes t)
(setq dired-recursive-copies t)
(setq dired-dwim-target t) ;;emacs dired copy file to another path in a easy way. give a suggestion.
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
(put 'dired-find-alternate-file 'disabled nil)

; wdired
(setq wdired-allow-to-change-permissions t)
(setq wdired-use-interactive-rename t)
(setq wdired-use-dired-vertical-movement t)
(setq wdired-confirm-overwrite t)

(add-hook 'dired-mode-hook
      '(lambda ()
         (evil-mode t)
         (dired-omit-mode 1)
         (define-key dired-mode-map  (kbd "SPC") nil)
         ))


; neotree
(global-set-key [f8] 'neotree-toggle)
;(setq projectile-switch-project-action 'neotree-projectile-action)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            ;(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

; ztree
(add-hook 'ztree-mode-hook
          (lambda ()
            (define-key evil-normal-state-map (kbd "<tab>") 'ztree-jump-side)
            (define-key evil-normal-state-map (kbd "D") 'ztree-diff-delete-file)
            (define-key evil-normal-state-map (kbd "r") 'ztree-diff-partial-rescan)
            ;;(define-key evil-normal-state-map (kbd "h") 'ztree-diff-toggle-show-equal-files)
            (define-key evil-normal-state-map (kbd "C") 'ztree-diff-copy)
            (define-key evil-normal-state-map (kbd "") 'ztree-perform-action)))

(defun ztree-toggle ()
  (interactive)
  (if (one-window-p)
      (progn
        (split-window-horizontally)
        (window-resize (get-buffer-window) (/ (window-body-width) -2) :horizontal t)
        (let ((file (buffer-file-name (current-buffer))))
          (if (and file (file-exists-p file))
              (ztree-dir (file-name-directory file))
            (call-interactively 'ztree-dir))))
    (delete-other-windows)))

(provide 'init-dired)
