;;; Uncomment the modules you'd like to use and restart Prelude afterwards

(setenv "GOPATH" "/home/ivan/work")
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "GOPATH") "/bin"))

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

(add-to-list 'load-path "~/.emacs.d/Emacs-wgrep")
(require 'wgrep)
(setq wgrep-auto-save-buffer t)
(setq wgrep-change-readonly-file t)

;(setq exec-path (append exec-path (list (expand-file-name "/home/ivan/work/bin/goflymake"))))

(setq exec-path (append exec-path (list (expand-file-name "/home/ivan/work/bin/gocode"))))

;(require 'go-flymake)
;(require 'go-flycheck)

(setq-default tab-width 2)
(setq-default indent-tabs-mode 1)
(setq-default standard-indent 2)

(defun how-many-region (begin end regexp &optional interactive)
  "Print number of non-trivial matches for REGEXP in region.
Non-interactive arguments are Begin End Regexp"
  (interactive "r\nsHow many matches for (regexp): \np")
  (let ((count 0) opoint)
    (save-excursion
      (setq end (or end (point-max)))
      (goto-char (or begin (point)))
      (while (and (< (setq opoint (point)) end)
                  (re-search-forward regexp end t))
        (if (= opoint (point))
            (forward-char 1)
          (setq count (1+ count))))
      (if interactive (message "%d occurrences" count))
      count)))

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many-region (point-min) (point-max) "^  "))
        (tab-count (how-many-region (point-min) (point-max) "^\t")))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(add-hook 'prog-mode-hook (lambda () (infer-indentation-style)))

;;(local-set-key (kbd "M-.") 'godef-jump)

(setq guru-warn-only 1)

(global-set-key [remap move-beginning-of-line]
                'move-beginning-of-line)

(exec-path-from-shell-initialize)

;;; Code
