(prelude-require-package 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(mapcar
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("Gemfile$" "Cheffile$" "Berksfile$" "config.ru$" "Rakefile$"
   "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$" "\\.rabl$"))
