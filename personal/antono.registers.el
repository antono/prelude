(setq dotfiles-dir "~/.emacs.d/")
(setq user-specific-dir "~/.emacs.d/personal/")

(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?c (file . ,(concat dotfiles-dir "personal/")))
             (?p (file . "~/Code"))
             (?s (file . ,"/ssh:antono.info:~/.dovecot.sieve"))
             (?r (file . ,(concat user-specific-dir "/antono.registers.el")))))
  (set-register (car r) (cadr r)))
