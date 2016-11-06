; solarized theme
(load-theme 'solarized-dark t)

(set-default-font "Monaco-13")
(set-fontset-font "fontset-default" 'han '("Hiragino Sans GB W3" . "unicode-bmp"))

;; init max
(set-frame-parameter nil 'fullscreen 'maximized)

;; sublimity
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)
(sublimity-mode 1)

;https://github.com/aspiers/smooth-scrolling
(smooth-scrolling-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/default-text-scale")
(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

; transparent of emacs
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

;(global-set-key [f5] 'toggle-frame-fullscreen)
;(set-frame-parameter nil 'fullscreen 'fullboth) ;; init fullboth

(provide 'init-ui)
