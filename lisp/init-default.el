
(setq ad-redefinition-action 'accept)  ;; Suppressing ad-handle-definition Warnings

(tool-bar-mode 0)

(menu-bar-mode 0)

(scroll-bar-mode 0)

(setq inhibit-startup-message t)        ;; Disable startup message

(setq gnus-inhibit-startup-message t)

(column-number-mode t)

(setq ring-bell-function 'ignore)

(setq visible-bell nil)

(fset 'yes-or-no-p 'y-or-n-p)    ;; type "y"/"n" instead of "yes"/"no"

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

(setq indent-line-function 'insert-tab)

(setq x-select-enable-clipboard t)

(setq evil-want-C-u-scroll t) ;; use C-u scroll up, set before evil loaded

(setq debug-on-error nil)

(setq gc-cons-threshold 20000000)

(setq make-backup-files nil)  ;; stop creating backup~ files

(setq auto-save-default nil) ;; stop creating #autosave# files

(setq tramp-default-method "ssh")

(global-hl-line-mode 1) ;; turn on highlighting current line

;; unicad For my language code setting (UTF-8)
(setq current-language-environment "UTF-8")

(setq locale-coding-system 'utf-8)

(set-terminal-coding-system 'utf-8)

(set-keyboard-coding-system 'utf-8)

(set-selection-coding-system 'utf-8)

(prefer-coding-system 'utf-8)

(provide 'init-default)
