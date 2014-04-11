;;; antono.evil --- Evil configuration
;;;
;;; Commentary:
;;;   My very own custom evil configurations...
;;;
;;; Code:
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-mode-line-format 'before)
(setq evil-want-C-u-scroll t)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("gray" bar))
(setq evil-motion-state-cursor '("gray" box))

(require 'evil)
(evil-mode 1)

;;
;; Evil Surround
;;
(unless (package-installed-p 'surround)
  (package-install 'surround))

(require 'surround)
(global-surround-mode 1)

;;
;; Evil Numbers
;;
(unless (package-installed-p 'evil-numbers)
  (package-install 'evil-numbers))

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-A")
  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-S-A")
  'evil-numbers/dec-at-pt)

;;
;; Other useful Commands
;;
(evil-ex-define-cmd "W"     'evil-write-all)
(evil-ex-define-cmd "Tree"  'speedbar-get-focus)
(evil-ex-define-cmd "linum" 'linum-mode)
(evil-ex-define-cmd "Align" 'align-regexp)


;; Scrolling
(defun evil-scroll-down-other-window ()
  (interactive)
  (scroll-other-window))

(defun evil-scroll-up-other-window ()
  (interactive)
  (scroll-other-window '-))

(define-key evil-normal-state-map
  (kbd "C-S-d") 'evil-scroll-down-other-window)

(define-key evil-normal-state-map
  (kbd "C-S-u") 'evil-scroll-up-other-window)
