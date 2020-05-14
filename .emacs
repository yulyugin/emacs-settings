(load "~/.emacs.d/host-settings" 'noerror)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("0959ef29a88d1c1ed30369d60352a6a4504ca985a3d6cd5b165797500679ee55" default)))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((c-indentation-style . linux)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ignore-errors load-theme 'wombat t)

;; Save compilation commands over session (and possibly other stuff too)
(require 'savehist)
(savehist-mode 1)

;; Ctags
(setq path-to-ctags "/usr/bin/ctags")

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
 )

;; Navigation
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

(global-set-key (kbd "C-n") 'next-error)
(global-set-key (kbd "C-p") 'previous-error)

;; Tabs as spaces
(setq-default indent-tabs-mode nil)

;; Indentation
(setq-default c-basic-offset 8)

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/lisp")

;; 81 line mark
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-color "cyan")
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'c++-mode-hook 'fci-mode)
(add-hook 'latex-mode-hook 'fci-mode)
(add-hook 'tex-mode-hook 'fci-mode)

;; Always highlights parenthesis
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;; Save backup files to /tmp/emacs-backup folder
(setq backup-directory-alist '(("." . "/tmp/emacs-backup")))
(setq make-backup-files t
      kept-new-verstions 6
      kept-old-verstions 3
      version-control t
      delete-old-versions t)

;; Scrolling settings
(setq scroll-conservatively 100)

(global-set-key (kbd "<f12>") 'compile)

(require 'diary)

; Spelling
(require 'ispell)

(setq ispell-personal-dictionary "~/.emacs.d/ispell/ru_RU")
(setq ispell-program-name "hunspell"
      ispell-dictionary   "russian")

(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)

;; Prevent emacs from exiting once the exit procedure has been initiated
(setq confirm-kill-emacs 'y-or-n-p)

(put 'downcase-region 'disabled nil)
