(setq shell-file-name "/bin/zsh")
(setq system-uses-terminfo nil)
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; shell configuration start
;;(setq shell-file-name "/bin/bash")
;;  (add-hook 'comint-output-filter-functions
;;            'comint-strip-ctrl-m)
;;(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
;;(setq comint-process-echoes t)

(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-to-list 'load-path "~/.emacs.d/pos-tip")
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t
(add-to-list 'load-path "~/.emacs.d/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete") 
(require 'auto-complete-config)
(global-auto-complete-mode t) 
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(add-to-list 'ac-modes 'shell-mode)
(ac-config-default)
(setq-default ac-sources
          '(
        ac-source-filename
        ac-source-dictionary
        ac-source-words-in-same-mode-buffers))
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
(setq ac-dwim t)
(setq ac-fuzzy-enable t)
(add-to-list 'load-path "~/.emacs.d/projectile")
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;;
;; ace jump mode major function
;;
(add-to-list 'load-path "~/.emacs.d/ace-jump-mode")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
 t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC
") 'ace-jump-mode)

(add-to-list 'load-path "~/.emacs.d/ag") ; only without ELPA/el-get
(require 'ag)

(add-to-list 'load-path "~/.emacs.d/ack-and-a-half") ; only without ELPA/el-get
(require 'ack-and-a-half)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
;; scrolling
;; (setq scroll-step 1)
;; (setq scroll-conservatively 10000)
;; (add-to-list 'load-path "~/.emacs.d/smooth-scrolling") ; only without ELPA/el-get
;; (require 'smooth-scrolling)
(add-to-list 'load-path "~/.emacs.d/sublimity-master") ; only without ELPA/el-get
(require 'sublimity)
(require 'sublimity-scroll)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)
;; (require 'sublimity-map)
;; (sublimity-map-set-delay 3)
;; (require 'sublimity-attractive)
(sublimity-mode 1)
;; fold and indent
(add-to-list 'load-path "~/.emacs.d/fold-dwim") ; only without ELPA/el-get
(require 'fold-dwim)
(add-to-list 'load-path "~/.emacs.d/hideshowvis") ; only without ELPA/el-get
(require 'hideshowvis)

( setq dired-recursive-deletes t) 
( setq dired-recursive-copies t) 
( require 'dired-x)  

(add-to-list 'load-path "~/.emacs.d/smex") ; only without ELPA/el-get
(require 'smex)
(global-set-key (kbd "M-x")  'smex)
(global-set-key (kbd "M-X")  'smex-major-mode-commands)
   
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(setq evil-want-C-u-scroll t)
(setq evil-default-cursor t)
(require 'evil)
(evil-mode 1)
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "jk" 'evil-normal-state)
(add-to-list 'load-path "~/.emacs.d/evil-leader")
(require 'evil-leader)
(evil-leader/set-key
"p" 'projectile-ag
"b" 'ido-switch-buffer
"w" 'switch-window
"s" 'save-buffer
"l" 'linum-mode
"f" 'ido-find-file
"j" 'ace-jump-mode
"k" 'kill-this-buffer
"e" 'ecb-restore-window-sizes
"d" 'dired-jump
"c" 'evil-ex
"v" 'ecb-toggle-compile-window
"x" 'smex
"o" 'occur
)
(setq evil-leader/leader "," evil-leader/in-all-states t)
(global-evil-leader-mode) 
(add-to-list 'load-path "~/.emacs.d/evil-numbers")
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-x C-a")  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x C-d")  'evil-numbers/dec-at-pt)

(load-file "~/.emacs.d/cedet/common/cedet.el")
 (global-ede-mode 1)                      ; Enable the Project management system
 (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
 (global-srecode-minor-mode 1)            ; Enable template insertion menu

(add-to-list 'load-path "~/.emacs.d/ecb") 
(require 'ecb)
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)

(setq ecb-compile-window-height 12)

(add-to-list 'load-path "~/.emacs.d/elscreen") ; only without ELPA/el-get
(require 'elscreen)
(elscreen-start)
(elscreen-toggle-display-tab)

(add-to-list 'load-path "~/.emacs.d/evil-tabs") ; only without ELPA/el-get
(require 'evil-tabs)
(global-evil-tabs-mode t)
(add-to-list 'load-path "~/.emacs.d/ido") ; only without ELPA/el-get

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(add-to-list 'load-path "~/.emacs.d/undo-tree") ; only without ELPA/el-get
(require 'undo-tree)
(global-undo-tree-mode)
(add-to-list 'load-path "~/.emacs.d/switch-window") ; only without ELPA/el-get
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(setq switch-window-shortcut-style 'qwerty)
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(setq solarized-termcolors 256)
(if
    (equal 0 (string-match "^24" emacs-version))
    ;; it's emacs24, so use built-in theme 
    (require 'solarized-dark-theme)
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))
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
;;(global-linum-mode 1) ; always show line numbers                              
;;(setq linum-format "%d")  ;set format 
;;
;;
;;(add-to-list 'load-path "~/.emacs.d/linum-relative") ; 
;;(require 'linum-relative)
;;(global-set-key (kbd "<f2>") 'linum-relative-toggle)
;;(set-cursor-color "#ffffff")   
;;(set-mouse-color "#ffffff")   
(column-number-mode t)   
;;(blink-cursor-mode -1)   
(setq ring-bell-function 'ignore)
(setq visible-bell nil)   
;; ;; spell check configuration
;; (setq-default ispell-program-name "aspell")
;; (setq ispell-dictionary "american")
;; (setq ispell-list-command "list")
;; (setq ispell-extra-args '("--sug-mode=ultra"))
;; 
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; 
;; (add-to-list 'ac-modes 'shell-mode)
;; (add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

(setq make-backup-files nil)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; remove ctrl-m from shell output
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-directories-general-face (quote ecb-directories-general-face))
 '(ecb-directory-face (quote ecb-default-highlight-face))
 '(ecb-history-face (quote ecb-default-highlight-face))
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.17261904761904762 . 0.29545454545454547) (ecb-sources-buffer-name 0.17261904761904762 . 0.22727272727272727) (ecb-methods-buffer-name 0.17261904761904762 . 0.29545454545454547) (ecb-history-buffer-name 0.17261904761904762 . 0.1590909090909091)))))
 '(ecb-method-face (quote ecb-method-face))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-analyse-face ((t (:inherit ecb-default-highlight-face :background "midnight blue"))))
 '(ecb-default-highlight-face ((t (:background "midnight blue"))))
 '(ecb-directory-face ((t (:inherit ecb-default-highlight-face :background "midnight blue"))))
 '(ecb-history-face ((t (:inherit ecb-default-highlight-face :background "midnight blue"))))
 '(ecb-method-face ((t (:inherit ecb-default-highlight-face :background "midnight blue"))))
 '(ecb-source-face ((t (:inherit ecb-default-highlight-face :background "midnight blue")))))

(defun create-shell ()
    "creates a shell with a given name"
    (interactive);; "Prompt\n shell name:")
    (let ((shell-name (read-string "shell name: " nil)))
    (shell (concat "*" shell-name "*"))))

(global-set-key [f5] 'toggle-frame-fullscreen)

;; Tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq x-select-enable-clipboard t)

(add-to-list 'load-path "~/.emacs.d/exec-path-from-shell-master") ; only without ELPA/el-get
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)

;; multi-term
(add-to-list 'load-path "~/.emacs.d/") ; only without ELPA/el-get
(require 'multi-term) ;; if not using the ELPA package

(setq multi-term-program "/bin/zsh")

(define-key global-map (kbd "C-x e") 'multi-term)

(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  (term-send-raw-string "\C-k"))

(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (term-send-raw-string "\C-k"))

(setq term-unbind-key-list '("C-x" "<ESC>"))
(setq term-bind-key-alist
      '(("C-c" . term-interrupt-subjob)
        ("C-p" . term-send-up)
        ("C-n" . term-send-down)
        ("C-s" . isearch-forward)
        ("C-r" . term-send-reverse-search-history)
        ("C-m" . term-send-raw)
        ("C-k" . term-send-kill-whole-line)
        ("C-y" . yank)
        ("C-_" . term-send-raw)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-K" . term-send-kill-line)
        ("M-p" . previous-line)
        ("M-n" . next-line)
        ("M-y" . yank-pop)
        ("M-." . term-send-raw-meta)))

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (evil-emacs-state)
            (setq term-buffer-maximum-size 0)))

;; turn off some minor mode under multi-term
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))
;; utf8
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

(add-to-list 'load-path "~/.emacs.d/org/lisp") ; only without ELPA/el-get
(require 'org-install) ;; if not using the ELPA package
(setq org-support-shift-select t)

(add-to-list 'load-path "~/.emacs.d/") ; only without ELPA/el-get
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; Python Mode configuration ToDo: put all configuration of python under minor-mode

; python-mode
(setq py-install-directory "~/.emacs.d/python-mode-6.1.3")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "/usr/local/bin/ipython") ;; which ipython
(setq-default py-which-bufname "IPython")

; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

; pymacs
(add-to-list 'load-path "~/.emacs.d/pymacs-0.25")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

; ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; fill-column-indicator
(add-to-list 'load-path "~/.emacs.d/fill-column-indicator")
(require 'fill-column-indicator)
;; (define-globalized-minor-mode
;; global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode t)


;;flymake with pyflakes
(setq-default py-shell-name "/usr/local/bin/ipython") ;; which ipython
(when (load "flymake" t) 
       (defun flymake-pyflakes-init () 
         (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                            'flymake-create-temp-inplace)) 
            (local-file (file-relative-name 
                         temp-file 
                         (file-name-directory buffer-file-name)))) 
           (list "pyflakes" (list local-file)))) 

       (add-to-list 'flymake-allowed-file-name-masks 
                '("\\.py\\'" flymake-pyflakes-init))) 

 (add-hook 'find-file-hook 'flymake-find-file-hook)
