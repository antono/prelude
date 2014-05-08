(prelude-require-packages '(projectile-rails rbenv))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq rbenv-installation-dir "/usr")

(mapcar
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("Gemfile$" "Cheffile$" "Berksfile$" "config.ru$" "Rakefile$"
   "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$" "\\.rabl$"))


(eval-after-load 'feature-mode
  '(progn
     (evil-define-key 'normal feature-mode-map
       (kbd "C-c C-a") 'feature-verify-all-scenarios-in-buffer)
     (evil-define-key 'normal feature-mode-map
       (kbd "C-c C-c") 'feature-verify-scenario-at-pos)
     (evil-define-key 'normal feature-mode-map
       (kbd "C-]") 'feature-goto-step-definition)))
(setq feature-cucumber-command "spring cucumber {options} {feature}")
