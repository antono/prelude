(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
             '("SC" . "http://joseito.republika.pl/sunrise-commander/") t)

(package-initialize)

(prelude-require-packages
 '(markdown-mode dart-mode helm-package helm-make helm-rb ag etags-select editorconfig))

;; http://editorconfig.org/
(load "editorconfig")
