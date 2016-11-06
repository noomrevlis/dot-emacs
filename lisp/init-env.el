
(exec-path-from-shell-initialize) ;; ensure environment variables inside Emacs look the same as in the user's shell.

; venv
(add-to-list 'load-path "~/.emacs.d/el-get/virtualenvwrapper")
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location '("/Users/noomrevlis/Projects/newchama/venv-newchama/"
                      "/Users/noomrevlis/Downloads/projects/flasky/venv/"))
(venv-workon "venv-newchama")

(provide 'init-env)
