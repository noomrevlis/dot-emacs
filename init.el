;;socks proxy settings for emacs url package.
;(setq url-gateway-method 'socks)
;(setq socks-server '("Default server" "127.0.0.1" 1080 5))

; Suppressing ad-handle-definition Warnings
(setq ad-redefinition-action 'accept)

;; package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; use C-u scroll up, set before evil loaded
(setq evil-want-C-u-scroll t)
;; el-get config
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files/")


;; ensure environment variables inside Emacs look the same as in the user's shell.
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)


(setq evil-default-cursor t)
(evil-mode t)

;; ac and related config Todo: put the package to el-get
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)

;; auto complete
(require 'auto-complete-config)
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
;; unbind some keys (inconvenient in iESS buffers)
(define-key ac-completing-map (kbd "M-n") nil)
(define-key ac-completing-map (kbd "M-p") nil)

; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;(setq projectile-switch-project-action 'neotree-projectile-action)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            ;(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

; projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; ace jump mode major function
;; consider use avy to replace it
;; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(require 'ace-jump-mode)
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC ") 'ace-jump-mode)

;; ag
(setq ag-reuse-buffers 't)
(setq ag-highlight-search t)
(add-hook 'ag-mode-hook
	  '(lambda ()
	     (evil-mode t)))


; dired config
(require 'dired-x)
;(setq dired-omit-files "^\\.pdf$\\|\\.git$\\|\\.DS_Store$")
(setq dired-omit-files "\\.DS_Store$")
(setq dired-omit-extensions (append '(".pyc" ".pyo")
                             dired-omit-extensions))
(setq dired-recursive-deletes t)
(setq dired-recursive-copies t)
;;emacs dired copy file to another path in a easy way. give a suggestion.
(setq dired-dwim-target t)

; wdired config
(setq wdired-allow-to-change-permissions t)
(setq wdired-use-interactive-rename t)
(setq wdired-use-dired-vertical-movement t)
(setq wdired-confirm-overwrite t)


(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
(put 'dired-find-alternate-file 'disabled nil)


;; helm
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

;; keychord
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

;; evil-leader  Todo: put to el-get
;(add-to-list 'load-path "~/.emacs.d/evil-leader")
(require 'evil-leader)
(evil-leader/set-key
"p" 'jedi:goto-definition-pop-marker
"b" 'ido-switch-buffer
"w" 'switch-window
"x" 'er/expand-region
"l" 'linum-mode
"f" 'ido-find-file
"j" 'ace-jump-mode
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

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-x C-a")  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x C-d")  'evil-numbers/dec-at-pt)


(require 'flx-ido)
(flx-ido-mode 1)
(ido-mode 1)
(ido-everywhere 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(setq switch-window-shortcut-style 'qwerty)

; solarized
(load-theme 'solarized-dark t)


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; no startup msg
(setq inhibit-startup-message t)        ; Disable startup message
(setq gnus-inhibit-startup-message t)
(set-default-font "Monaco-13")
(set-fontset-font "fontset-default" 'han '("Hiragino Sans GB W3" . "unicode-bmp"))
;; turn on highlighting current line
(global-hl-line-mode 1)

(require 'linum)
(column-number-mode t)
;;(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)
(setq visible-bell nil)


;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; remove ctrl-m from shell output
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

(setq ediff-keep-variants nil)

;(global-set-key [f5] 'toggle-frame-fullscreen)

;; Tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


(setq x-select-enable-clipboard t)

;; multi-term
(require 'multi-term)
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


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


; use IPython
;(setq-default py-shell-name "/usr/local/bin/ipython") ;; which ipython
;(setq-default py-which-bufname "IPython")

; don't split windows
;(setq py-split-windows-on-execute-p nil)

;(define-key python-mode-map (kbd "C-c |") 'py-execute-region-ipython-switch)
;(define-key python-mode-map (kbd "C-c C-c") 'py-execute-buffer-ipython-switch)


; try to automagically figure out indentation
(setq py-smart-indentation t)

;; fill-column-indicator
(require 'fill-column-indicator)

;; alternative flycheck http://www.flycheck.org/en/latest/user/installation.html
;;flymake with pyflakes
(when (load "flymake" t)
       (defun flymake-pyflakes-init ()
         (let* ((temp-file (flymake-init-create-temp-buffer-copy
                            'flymake-create-temp-inplace))
            (local-file (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
                (list "pyflakes" (list local-file))
                ;(list "pep8" (list "--repeat" local-file))
           )
         )

       (add-to-list 'flymake-allowed-file-name-masks
                '("\\.py\\'" flymake-pyflakes-init)))

; flymake hint
(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'my-flymake-show-help)

;; automatically activate flymake-mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'python-mode-hook '(lambda () (fci-mode 1)))

(add-to-list 'load-path "~/.emacs.d/el-get/virtualenvwrapper")
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location '("/Users/noomrevlis/Projects/newchama/venv-newchama/"
                      "/Users/noomrevlis/Downloads/projects/flasky/venv/"))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default ediff-ignore-similar-regions t)
(setq ediff-split-window-function 'split-window-horizontally)


;; This is what you probably want if you are using a tiling window
;; manager under X, such as ratpoison.

 ;; Some custom configuration to ediff
 (defvar my-ediff-bwin-config nil "Window configuration before ediff.")
 (defcustom my-ediff-bwin-reg ?b
   "*Register to be set up to hold `my-ediff-bwin-config'
 configuration.")

 (defvar my-ediff-awin-config nil "Window configuration after ediff.")
 (defcustom my-ediff-awin-reg ?e
   "*Register to be used to hold `my-ediff-awin-config' window
 configuration.")

 (defun my-ediff-bsh ()
   "Function to be called before any buffers or window setup for
 ediff."
   (setq my-ediff-bwin-config (current-window-configuration))
   (when (characterp my-ediff-bwin-reg)
 	(set-register my-ediff-bwin-reg
 		      (list my-ediff-bwin-config (point-marker)))))

 (defun my-ediff-ash ()
   "Function to be called after buffers and window setup for ediff."
   (setq my-ediff-awin-config (current-window-configuration))
   (when (characterp my-ediff-awin-reg)
 	(set-register my-ediff-awin-reg
 		      (list my-ediff-awin-config (point-marker)))))

 (defun my-ediff-qh ()
   "Function to be called when ediff quits."
   (when my-ediff-bwin-config
 	(set-window-configuration my-ediff-bwin-config)))

(add-hook 'ediff-before-setup-hook 'my-ediff-bsh)
(add-hook 'ediff-after-setup-windows-hook 'my-ediff-ash 'append)
(add-hook 'ediff-quit-hook 'my-ediff-qh)


;;ztree
(require 'ediff-trees)
(require 'ztree-diff)
(require 'ztree-dir)

;; ztree key-binding
(add-hook 'ztree-mode-hook
          (lambda ()
            (define-key evil-normal-state-map (kbd "<tab>") 'ztree-jump-side)
            (define-key evil-normal-state-map (kbd "D") 'ztree-diff-delete-file)
            (define-key evil-normal-state-map (kbd "r") 'ztree-diff-partial-rescan)
            ;;(define-key evil-normal-state-map (kbd "h") 'ztree-diff-toggle-show-equal-files)
            (define-key evil-normal-state-map (kbd "C") 'ztree-diff-copy)
            (define-key evil-normal-state-map (kbd "") 'ztree-perform-action)
            ))

;; expand-region
(require 'expand-region)

;; For my language code setting (UTF-8)
(require 'unicad)
(setq current-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;(require 'markerpen)

(require 'pcre2el)
(require 're-builder)
(setq reb-re-syntax 'pcre)


; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  ;(setq ns-function-modifier 'control)
  ;(setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)
  )

(add-hook 'dired-mode-hook
      '(lambda ()
         (evil-mode t)
         (dired-omit-mode 1)
         (define-key dired-mode-map  (kbd "SPC") nil)
         ))

(setq tramp-default-method "ssh")

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


(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))


 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

(modify-frame-parameters nil `((alpha . 95)))

;dash
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

(add-to-list 'dash-at-point-mode-alist '(python-mode. "python3"))

; example
(add-hook 'python-mode-hook
          (lambda () (setq dash-at-point-docset "python3")))

(setq debug-on-error nil)
(setq gc-cons-threshold 20000000)


(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;; org
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(auto-image-file-mode t) ;; image alive


; fix the slow problem
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4)))
(setq shackle-lighter "s")
(shackle-mode t)


;; init max
(set-frame-parameter nil 'fullscreen 'maximized)

;; init fullboth
;(set-frame-parameter nil 'fullscreen 'fullboth)

(venv-workon "venv-newchama")

(global-set-key (kbd "C-x g") 'magit-status)

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


;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

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

(add-to-list 'load-path "~/.emacs.d/el-get/default-text-scale")
(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; workaround for long ControlPath on darwin
;;https://github.com/martinp/emacs.d/blob/master/lisp/init-tramp.el

;;you have to switch to emacs-25 or use the last version of tramp, or modify tramp-ssh-controlmaster-options
;;https://github.com/emacs-helm/helm/issues/1000
(when (eq system-type 'darwin)
  (setq tramp-ssh-controlmaster-options
  "-o ControlPath=/tmp/%%r@%%h:%%p -o ControlMaster=auto -o ControlPersist=no"))

;; smooth scroll
(require 'sublimity)
(require 'sublimity-scroll)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)
(sublimity-mode 1)

(defun tf-toggle-show-trailing-whitespace ()
  "Toggle show-trailing-whitespace between t and nil"
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))

;; Remove trailing whitespace manually by typing C-t C-w.
(add-hook 'python-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)))

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
              '(lambda()
                 (save-excursion
                   (delete-trailing-whitespace))))))

;https://github.com/aspiers/smooth-scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
