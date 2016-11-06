
;; auto complete
(setq ac-quick-help-prefer-pos-tip t) 
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(add-to-list 'ac-modes 'shell-mode)
(ac-config-default)
(setq-default ac-sources
        '(ac-source-filename
          ac-source-dictionary
          ac-source-words-in-same-mode-buffers))
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
(setq ac-dwim t)
(setq ac-fuzzy-enable t)
(setq ac-auto-show-menu 0)         ; 当补全提示时 (ac-start), 立即展开补全列表...
(setq ac-ignore-case nil)          ; ...要区分大小写...
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

(define-key ac-completing-map (kbd "M-n") nil) ;; unbind some keys (inconvenient in iESS buffers)
(define-key ac-completing-map (kbd "M-p") nil)

(provide 'init-complete)
