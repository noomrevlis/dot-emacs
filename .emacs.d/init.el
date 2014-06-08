(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; shell configuration start
(setq shell-file-name "/bin/bash")
  (add-hook 'comint-output-filter-functions
            'comint-strip-ctrl-m)
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)
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
   
(add-to-list 'load-path "~/.emacs.d/evil-master") ; only without ELPA/el-get
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
"c" 'shell-command
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
(toggle-frame-fullscreen)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq x-select-enable-clipboard t)

(add-to-list 'load-path "~/.emacs.d/exec-path-from-shell-master") ; only without ELPA/el-get
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)
