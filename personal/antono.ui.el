(getenv "XDG_CONFIG_HOME")
(setenv "XDG_CONFIG_HOME" nil)

(global-flycheck-mode -1)
(global-hl-line-mode -1)

(when window-system
  (setq frame-title-format '(buffer-file-name "Emacs: %f" ("%b")))
  ;; (set-face-attribute 'default nil :font "Liberation Mono" :height 135)
  )


;; (add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Transparently open compressed files
(auto-compression-mode t)

;; Type less: y instead yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Nice linum padding
;;
;; (setq linum-format
;;       (lambda (line)
;;         (propertize
;;          (format
;;           (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
;;             (concat " %" (number-to-string w) "d "))
;;           line)
;;          'face
;;          'linum)))
;; (global-linum-mode)

;;
;; Speedbar
;;
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)

(load-theme 'wombat)

;; Draw line feed ^L as line!
(prelude-require-package 'pp-c-l)
(require 'pp-c-l)
(pretty-control-l-mode 1)

;;
;; Powerline
;;
(prelude-require-package 'powerline)
(require 'powerline)
(powerline-vim-theme)

;;
;; Underscore "_" is not a word character
;; https://bitbucket.org/lyro/evil/wiki/Home
(modify-syntax-entry ?_ "w")
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(custom-set-variables
 '(projectile-tags-command "ripper-tags -R --format=emacs --force -f TAGS %s"))


(provide 'antono.ui)
;;; antono.ui ends here
