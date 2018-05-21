;; (getenv "XDG_CONFIG_HOME")
;; (setenv "XDG_CONFIG_HOME" nil)

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
;; Speedbar
;;
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)

(load-theme 'wombat)

;; Draw line feed ^L as line!
;; (prelude-require-package 'pp-c-l)
;; (require 'pp-c-l)
;; (pretty-control-l-mode 1)

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


;; Dark theme in gnome 3
;; (defun set-selected-frame-dark ()
;;   (interactive)
;;   (let ((frame-name
;;          (get-frame-name (selected-frame))))
;;     (call-process-shell-command (concat "xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT \"dark\" -name \""
;;                                         frame-name
;;                                         "\""))))
;; (if (window-system)
;;     (set-selected-frame-dark))


(defun set-dark-wm-theme (frame)
  (select-frame frame) ;; this is important!
  (when (display-graphic-p)
    (progn
      (when (file-exists-p "/usr/bin/xprop")
        (progn
          (defvar winid nil)
          (setq winid (frame-parameter frame 'outer-window-id))
          (call-process "xprop" nil nil nil "-f" "_GTK_THEME_VARIANT" "8u" "-set" "_GTK_THEME_VARIANT" "dark" "-id" winid))))))

(defun on-after-init ()
  (set-dark-wm-theme (selected-frame))
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(add-hook 'after-make-frame-functions 'set-dark-wm-theme)

(provide 'antono.ui)
;;; antono.ui ends here
