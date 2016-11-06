
;; ace jump mode major function
;; consider use avy to replace it
;; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC ") 'ace-jump-mode)



; parent
(show-paren-mode t)  ;; 显示括号匹配
(setq show-paren-style 'parentheses)

;; regex
(setq reb-re-syntax 'pcre)  


; keychord
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

; undo tree
(global-undo-tree-mode)

; switch window
(global-set-key (kbd "C-x o") 'switch-window)
(setq switch-window-shortcut-style 'qwerty)

;linum
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)


; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  ;(setq ns-function-modifier 'control)
  ;(setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)
  )

;; workaround for long ControlPath on darwin
;;https://github.com/martinp/emacs.d/blob/master/lisp/init-tramp.el

;;you have to switch to emacs-25 or use the last version of tramp, or modify tramp-ssh-controlmaster-options
;;https://github.com/emacs-helm/helm/issues/1000
(when (eq system-type 'darwin)
  (setq tramp-ssh-controlmaster-options
  "-o ControlPath=/tmp/%%r@%%h:%%p -o ControlMaster=auto -o ControlPersist=no"))


;; org
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(auto-image-file-mode t) ;; image alive

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;dash
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)
(add-to-list 'dash-at-point-mode-alist '(python-mode. "python3"))

;magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Ensure ibuffer opens with point at the current buffer's entry.
(defadvice ibuffer
  (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)


(add-hook 'ibuffer-hook
  (lambda ()
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic))))

;; http://www.emacswiki.org/HighlightParentheses
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                    (if autopair-handle-action-fns
                        autopair-handle-action-fns
                      '(autopair-default-handle-action))
                    '((lambda (action pair pos-before)
                        (hl-paren-color-update)))))))


;;  using the following to integrate highlight-parentheses with autopair mode:
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (highlight-parentheses-mode)
             (setq autopair-handle-action-fns
                   (list 'autopair-default-handle-action
                         '(lambda (action pair pos-before)
                            (hl-paren-color-update))))))



(defun tf-toggle-show-trailing-whitespace ()
  "Toggle show-trailing-whitespace between t and nil"
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))

(provide 'init-helper)
