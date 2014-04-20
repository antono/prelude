(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(prelude-require-packages
 '(markdown-mode dart-mode helm-package helm-make helm-rb))
