;; load packages
(let ((default-directory "~/.emacs.d/packages/"))
  (normal-top-level-add-subdirs-to-load-path))

;; elpa
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

;; packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; install packages if not installed
(package-initialize)
(defvar my-packages '(
                      flycheck
                      auto-complete
		      editorconfig
		      monokai-theme
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; hide init
(setq inhibit-startup-message t)

;; theme solarized
(load-theme 'monokai t)

;; highlight current line
(global-hl-line-mode +1)

;; delete selected text on write
(delete-selection-mode 1)

;; word wrap
(global-visual-line-mode t)

;; line numbers
(global-linum-mode t)

;; hide menu and tools bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; better answer
(fset 'yes-or-no-p 'y-or-n-p)

;; truncate
(toggle-truncate-lines)

;; ido mode
(ido-mode 1)

;; display them one per line
(setq ido-separator "\n")

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ignore
(setq ido-ignore-buffers
'("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*"))

;; C/C++
(defun my-c-mode-config ()
  (setq tab-width        4
        c-basic-offset   4))

(add-hook 'c-mode-hook 'my-c-mode-config)

;; orgmode
(setq org-startup-indented t)
(setq org-hide-leading-stars t)

;; webmode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

;; webmode identation
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; jsdoc
(require 'js-doc)
(setq js-doc-mail-address "beracochea@fastmail.com"
      js-doc-author (format "Martin Beracochea <%s>" js-doc-mail-address))

(add-hook 'js2-mode-hook
	  #'(lambda ()
	      (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
	      (define-key js2-mode-map "@" 'js-doc-insert-tag)))

;; store back up files on the temp directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;; sass
(autoload 'scss-mode "sass-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . flyspell-mode))
(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))

;; git
(require 'git)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 30)

;; autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; editorconfig
(load "editorconfig")

;; mac  key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (setq ns-function-modifier 'control)
  ;;(setq mac-function-modifier 'control)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  (setq edconf-exec-path "/usr/local/bin/editorconfig") ;; editor config exec
  (setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(org-export-backends (quote (ascii html md odt)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
