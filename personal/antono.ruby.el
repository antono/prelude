(prelude-require-packages '(projectile-rails rbenv))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq rbenv-installation-dir "/usr")

(mapcar
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("Gemfile$" "Cheffile$" "Berksfile$" "config.ru$" "Rakefile$"
   "Guardfile$" "Capfile$" "*\.rb" "\\.rake$" "\\.gemspec$" "\\.rabl$"))

(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(eval-after-load 'feature-mode
  '(progn
     (evil-define-key 'normal feature-mode-map
       (kbd "C-c C-a") 'feature-verify-all-scenarios-in-buffer)
     (evil-define-key 'normal feature-mode-map
       (kbd "C-c C-c") 'feature-verify-scenario-at-pos)
     (evil-define-key 'normal feature-mode-map
       (kbd "C-]") 'feature-goto-step-definition)))
(setq feature-cucumber-command "spring cucumber {options} {feature}")

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))

(ad-activate 'rspec-compile)

; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
