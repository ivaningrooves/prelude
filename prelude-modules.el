;;; Uncomment the modules you'd like to use and restart Prelude afterwards

;; Emacs IRC client
(require 'prelude-erc)
(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
;; (require 'prelude-helm) ;; Interface for narrowing and search
;; (require 'prelude-helm-everywhere) ;; Enable Helm everywhere
(require 'prelude-company)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-mediawiki)
;; (require 'prelude-evil)

;;; Programming languages support
(require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
;; (require 'prelude-css)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
(require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-ocaml)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
;; (require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-scala)
(require 'prelude-scheme)
(require 'prelude-shell)
;; (require 'prelude-scss)
;; (require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
;; (require 'prelude-yaml)

(require 'go-errcheck)


(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#111")

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/work/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)

(setq-default tab-width 2)
(setq-default indent-tabs-mode 1)
(setq-default standard-indent 2)

;;(local-set-key (kbd "M-.") 'godef-jump)

(setq guru-warn-only 1)

(global-set-key [remap move-beginning-of-line]
                'move-beginning-of-line)

;;; Code
