;; ag
(setq ag-reuse-buffers 't)
(setq ag-highlight-search t)
(add-hook 'ag-mode-hook
	  '(lambda ()
	     (evil-mode t)))


(projectile-global-mode)  ; projectile
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)


(require 'helm)
;(require 'helm-config)
(global-set-key (kbd "M-x")  'helm-M-x)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h s") 'helm-swoop)
(setq helm-swoop-use-fuzzy-match t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      ;helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      ;helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      ;helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      ;helm-ff-file-name-history-use-recentf t
      )

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

; helm-ag
(setq helm-ag-use-agignore t)


; fix the slow problem
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4)))
(setq shackle-lighter "s")
(shackle-mode t)

; ido
(flx-ido-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil) ;; disable ido faces to see flx highlights.
(ido-vertical-mode 1)


(provide 'init-search)
