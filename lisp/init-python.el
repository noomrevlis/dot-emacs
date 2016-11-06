
; try to automagically figure out indentation
(setq py-smart-indentation t)


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

(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

; flymake hint
(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'my-flymake-show-help)

;; automatically activate flymake-mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; fill-column-indicator
(add-hook 'python-mode-hook '(lambda () (fci-mode 1)))


;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
              '(lambda()
                 (save-excursion
                   (delete-trailing-whitespace))))))


; dash doc 
(add-hook 'python-mode-hook
          (lambda () (setq dash-at-point-docset "python3")))

; use IPython
;(setq-default py-shell-name "/usr/local/bin/ipython") ;; which ipython
;(setq-default py-which-bufname "IPython")

; don't split windows
;(setq py-split-windows-on-execute-p nil)

;(define-key python-mode-map (kbd "C-c |") 'py-execute-region-ipython-switch)
;(define-key python-mode-map (kbd "C-c C-c") 'py-execute-buffer-ipython-switch)

(provide 'init-python)
