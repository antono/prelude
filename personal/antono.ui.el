
(when window-system
  (setq frame-title-format '(buffer-file-name "Emacs: %f" ("%b")))
  (tooltip-mode t)
  (mouse-wheel-mode t)
  (set-face-attribute 'default nil :font "Liberation Mono" :height 120))

;; (add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Transparently open compressed files
(auto-compression-mode t)

;; Type less: y instead yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Nice linum padding
;;
(setq linum-format
      (lambda (line)
        (propertize
         (format
          (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
            (concat " %" (number-to-string w) "d "))
          line)
         'face
         'linum)))

(linum-mode)

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

;;
;; Powerline
;;
(unless (package-installed-p 'powerline)
  (package-install 'powerline))
(require 'powerline)
(powerline-vim-theme)

(provide 'antono.ui)
;;; antono.ui ends here
