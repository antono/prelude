(prelude-require-packages '(projectile-rails rbenv))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq rbenv-installation-dir "/usr/bin/rbenv")

(mapcar
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("Gemfile$" "Cheffile$" "Berksfile$" "config.ru$" "Rakefile$"
   "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$" "\\.rabl$"))
