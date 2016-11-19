((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
            (dash s)))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (autopair status "installed" recipe
           (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (avy status "installed" recipe
      (:name avy :description "Jump to things in Emacs tree-style." :type github :pkgname "abo-abo/avy" :depends
             (cl-lib)))
 (browse-kill-ring status "installed" recipe
                   (:name browse-kill-ring :description "Interactively insert items from kill-ring" :type github :pkgname "browse-kill-ring/browse-kill-ring" :prepare
                          (progn
                            (autoload 'browse-kill-ring-default-keybindings "browse-kill-ring"))))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (dash-at-point status "installed" recipe
                (:name dash-at-point :description "Search the word at point with Dash. Dash is an API Documentation Browser and Code Snippet Manager. dash-at-point make it easy to search the word at point with Dash." :type github :pkgname "stanaka/dash-at-point"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (ediff-trees status "installed" recipe
              (:name ediff-trees :auto-generated t :type emacswiki :description "Recursively ediff two directory trees " :website "https://raw.github.com/emacsmirror/emacswiki.org/master/ediff-trees.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (emacs-async status "installed" recipe
              (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (evil status "installed" recipe
       (:name evil :website "https://bitbucket.org/lyro/evil" :description "Evil is an extensible vi layer for Emacs. It\n       emulates the main features of Vim, and provides facilities\n       for writing custom extensions." :type hg :url "https://bitbucket.org/lyro/evil" :features evil :depends
              (undo-tree goto-chg)
              :build
              (("make" "info" "all"))
              :build/berkeley-unix
              (("gmake" "info" "all"))
              :build/darwin
              `(("make" ,(format "EMACS=%s" el-get-emacs)
                 "info" "all"))
              :info "doc"))
 (evil-leader status "installed" recipe
              (:name evil-leader :website "http://github.com/cofi/evil-leader" :description "Add <leader> shortcuts to Evil, the extensible vim\n       emulation layer" :type github :pkgname "cofi/evil-leader" :features evil-leader :depends evil))
 (evil-numbers status "installed" recipe
               (:name evil-numbers :website "http://github.com/cofi/evil-numbers" :description "Increment/decrement numbers in Evil, the extensible vim\n       emulation layer. Like C-a/C-x in vim.\n\n       After installation, you will need to add a key-binding for evil-numbers.\n       For example:\n\n       (define-key evil-normal-state-map (kbd \"C-c +\") 'evil-numbers/inc-at-pt)\n       (define-key evil-normal-state-map (kbd \"C-c -\") 'evil-numbers/dec-at-pt)" :type github :pkgname "cofi/evil-numbers" :features evil-numbers :depends evil))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (fill-column-indicator status "installed" recipe
                        (:name fill-column-indicator :type github :website "https://github.com/alpaker/Fill-Column-Indicator#readme" :description "An Emacs minor mode that graphically indicates the fill column." :pkgname "alpaker/Fill-Column-Indicator"))
 (flx status "installed" recipe
      (:name flx :description "Fuzzy matching with good sorting in ido" :type github :pkgname "lewang/flx"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-modes status "installed" recipe
            (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (goto-chg status "installed" recipe
           (:name goto-chg :description "Goto the point of the most recent edit in the buffer." :type emacswiki))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :compile nil))
 (helm-ag status "installed" recipe
          (:name helm-ag :description "The silver search with helm interface." :type github :pkgname "syohex/emacs-helm-ag" :depends
                 (helm)))
 (helm-swoop status "installed" recipe
             (:name helm-swoop :type github :description "Efficiently hopping squeezed lines powered by Emacs helm interface" :pkgname "ShingoFukuyama/helm-swoop" :depends
                    (helm)))
 (highlight-parentheses status "installed" recipe
                        (:name highlight-parentheses :description "Highlight the matching parentheses surrounding point." :type github :pkgname "nschum/highlight-parentheses.el"))
 (ibuffer-vc status "installed" recipe
             (:name ibuffer-vc :description "Group ibuffer's list by VC project, or show VC status" :type github :pkgname "purcell/ibuffer-vc"))
 (ido-vertical-mode status "installed" recipe
                    (:name ido-vertical-mode :type github :pkgname "rson/ido-vertical-mode.el" :description "makes ido-mode display vertically"))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
              (epc auto-complete python-environment)))
 (json-rpc status "installed" recipe
           (:name json-rpc :description "JSON-RPC library." :type github :pkgname "skeeto/elisp-json-rpc"))
 (key-chord status "installed" recipe
            (:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :depends
               (dash with-editor emacs-async)
               :info "Documentation" :load-path "lisp/" :compile "lisp/" :build
               `(("make" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/berkeley-unix
               `(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/windows-nt
               (with-temp-file "lisp/magit-autoloads.el" nil)))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type github :pkgname "jrblevin/markdown-mode" :prepare
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (multi-term status "installed" recipe
             (:name multi-term :description "A mode based on term.el, for managing multiple terminal buffers in Emacs." :type emacswiki :features multi-term))
 (neotree status "installed" recipe
          (:name neotree :website "https://github.com/jaypei/emacs-neotree" :description "An Emacs tree plugin like NerdTree for Vim." :type github :branch "master" :pkgname "jaypei/emacs-neotree"))
 (pcre2el status "installed" recipe
          (:name pcre2el :description "pcre2el: parse, convert, and font-lock PCRE, Emacs and rx regexps" :type github :pkgname "joddie/pcre2el"))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (pos-tip status "installed" recipe
          (:name pos-tip :description "Show tooltip at point" :type emacswiki))
 (projectile status "installed" recipe
             (:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
                    (dash s f pkg-info)))
 (python-environment status "installed" recipe
                     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
                            (deferred)))
 (python-mode status "installed" recipe
              (:name python-mode :description "Major mode for editing Python programs" :type bzr :url "lp:python-mode" :load-path
                     ("." "test")
                     :compile nil :prepare
                     (progn
                       (autoload 'python-mode "python-mode" "Python editing mode." t)
                       (autoload 'doctest-mode "doctest-mode" "Doctest unittest editing mode." t)
                       (setq py-install-directory
                             (el-get-package-directory "python-mode"))
                       (add-to-list 'auto-mode-alist
                                    '("\\.py$" . python-mode))
                       (add-to-list 'interpreter-mode-alist
                                    '("python" . python-mode)))))
 (pythonic status "installed" recipe
           (:name pythonic :description "Utility functions for writing pythonic emacs package." :type github :pkgname "proofit404/pythonic"))
 (request status "installed" recipe
          (:name request :description "Easy HTTP request for Emacs Lisp" :type github :submodule nil :pkgname "tkf/emacs-request"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (shackle status "installed" recipe
          (:name shackle :description "Enforce rules for popups." :website "https://github.com/wasamasa/shackle" :type github :pkgname "wasamasa/shackle"))
 (smartparens status "installed" recipe
              (:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
 (smooth-scrolling status "installed" recipe
                   (:name smooth-scrolling :description "Make emacs scroll smoothly, keeping the point away from the top and bottom of the current buffer's window in order to keep lines of context around the point visible as much as possible, whilst avoiding sudden scroll jumps which are visually confusing." :type github :pkgname "aspiers/smooth-scrolling" :features smooth-scrolling))
 (solarized-emacs status "installed" recipe
                  (:name solarized-emacs :description "Solarized for Emacs is an Emacs port of the Solarized theme for vim, developed by Ethan Schoonover." :website "https://github.com/bbatsov/solarized-emacs" :minimum-emacs-version "24" :type github :pkgname "bbatsov/solarized-emacs" :depends dash :prepare
                         (add-to-list 'custom-theme-load-path default-directory)))
 (sublimity status "installed" recipe
            (:name sublimity :description "smooth-scrolling, minimap and distraction-free mode." :website "https://github.com/zk-phi/sublimity" :type github :pkgname "zk-phi/sublimity"))
 (switch-window status "installed" recipe
                (:name switch-window :description "A *visual* way to choose a window to switch to" :type github :pkgname "dimitri/switch-window" :features switch-window))
 (undo-tree status "installed" recipe
            (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (unicad status "installed" recipe
         (:name unicad :auto-generated t :type emacswiki :description "an elisp port of Mozilla Universal Charset Auto Detector" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/unicad.el"))
 (use-package status "installed" recipe
              (:name use-package :type github :description "A use-package declaration for simplifying your .emacs" :pkgname "jwiegley/use-package"))
 (virtualenvwrapper status "installed" recipe
                    (:name virtualenvwrapper :type github :website "https://github.com/porterjamesj/virtualenvwrapper.el" :description "virtualenv tool for emacs" :pkgname "porterjamesj/virtualenvwrapper.el"))
 (web-mode status "installed" recipe
           (:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (websocket status "installed" recipe
            (:name websocket :description "A websocket implementation in elisp, for emacs." :type github :pkgname "ahyatt/emacs-websocket"))
 (with-editor status "installed" recipe
   (:name with-editor :description "Use the Emacsclient as $EDITOR" :type github :pkgname "magit/with-editor"))
 (ztree status "installed" recipe
        (:name ztree :description "Text-tree applications inside Emacs." :type github :pkgname "fourier/ztree")))
