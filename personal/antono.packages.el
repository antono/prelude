(require 'package)

(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(prelude-require-packages
 '(
   markdown-mode
   dart-mode
   ;; helm-package
   helm-make
   helm-rb
   ;; etags-select
   rubocop
   editorconfig
   ;; Rust related packages
   rust-mode
   toml-mode
   cargo
   flycheck-rust
   flymake-rust
   racer
)) 

;; http://editorconfig.org/
(require 'editorconfig)
(editorconfig-mode 1)
