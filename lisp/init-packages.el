
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")  ;; el-get config
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files/")

(provide 'init-packages)
