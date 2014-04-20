(prelude-require-packages '(mo-git-blame persp-mode))

(global-set-key (kbd "s-l")     'helm-mini)
(global-set-key (kbd "C-S-s-l") 'helm-locate)
(global-set-key (kbd "s-i")     'helm-imenu)
(global-set-key (kbd "s-B")     'helm-bookmarks)
(global-set-key (kbd "s-e")     'speedbar-get-focus)
(global-set-key (kbd "s-b")     'ibuffer)
(global-set-key (kbd "s-g")     'rgrep)
(global-set-key (kbd "s-M")     'helm-make)
(global-set-key (kbd "s-L")     'helm-projectile)
(global-set-key (kbd "s-P")     'helm-package)
(global-set-key (kbd "<f7>")    'whitespace-mode)
(global-set-key (kbd "C-<f7>")  'whitespace-cleanup)

(global-set-key (kbd "<f8>")    'compile)
(global-set-key (kbd "C-x V g") 'mo-git-blame-current)

(global-set-key (kbd "s-p") 'persp-next)
(global-set-key (kbd "s-n") 'persp-prev)

;; Kinda Ctrl+^ in Vim
(define-key global-map "\C-^"
  (lambda ()
    (interactive)
    (switch-to-buffer (other-buffer))))
