(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

(setq script-dir (file-name-directory load-file-name))
(add-to-list 'load-path (concat script-dir ".emacs.d/"))
(let ((default-directory (concat script-dir ".emacs.d/")))
  (normal-top-level-add-subdirs-to-load-path))

(setq inhibit-splash-screen t)
(setq confirm-kill-emacs 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)

(require 'saveplace)
(setq save-place-file "~/.emacs.d/.saveplace")
(setq-default save-place t)

(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

(setq x-select-enable-clipboard t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'multi-term)


(require 'go-mode)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;; Always use space instead of tab.
(defun space-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (setq-default tab-width 4))
(add-hook 'c-mode-common-hook 'space-hook t)

(setq-default tab-width 4)

(require 'package)
(setq package-user-dir (concat script-dir ".emacs.d/elpa"))

(setq package-archives '())
;;(add-to-list 'package-archives '("gnu" . "http://127.0.0.1:17204/packages/")) ;;elpa.gnu.org
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;;marmalade-repo.org ;;17203
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))


(setq term-unbind-key-list '("C-x" "C-c" "C-h" "C-y" "M-w"))
(setq term-bind-key-alist '(("C-c C-c" . term-interrupt-subjob)
                            ("C-a" . term-send-raw)
                            ("C-b" . term-send-raw)
                            ("C-d" . term-send-raw)
                            ("C-e" . term-send-raw)
                            ("C-f" . term-send-raw)
                            ("C-i" . term-send-raw)
                            ("C-j" . term-send-raw)
                            ("C-k" . term-send-raw)
                            ("C-l" . term-send-raw)
                            ("C-m" . term-send-raw)
                            ("C-n" . term-send-raw)
                            ("C-o" . term-send-raw)
                            ("C-p" . term-send-raw)
                            ("C-q" . term-send-raw)
                            ("C-r" . term-send-raw)
                            ("C-t" . term-send-raw)
                            ("C-u" . term-send-raw)
                            ("C-v" . term-send-raw)
                            ("C-w" . term-send-raw)
                            ("C-y" . term-paste)
                            ("C-z" . term-send-raw)
                            ))

;; Terminal mode escape key.
(defun term-escape-hook ()
  (term-set-escape-char ?\C-x)
  (define-key term-raw-map "\M-1" 'xiaye-mode)
  (define-key term-raw-map "\M-x" 'smex)
)

;; Custom ansi color pallete			     
;; (defun term-color-hook ()
;;   (setq ansi-term-color-vector [unspecified "#000000" "#ba4949" "#3dc53d" "#eaea5c" "#5e9edc" "#eca6eb" "#e69c5e" "#f5f3e8"])
;;   (setq ansi-color-names-vector [unspecified "#000000" "#ba4949" "#3dc53d" "#eaea5c" "#5e9edc" "#eca6eb" "#e69c5e" "#f5f3e8"])
;; )
(require 'gist)
(add-hook 'term-mode-hook 'term-escape-hook t)
;; (add-hook 'term-mode-hook 'term-color-hook t)

;; (add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Enable terminal mouse support
(if (window-system) t (xterm-mouse-mode 1))

(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories (concat script-dir "/.emacs.d//ac-dict"))
(ac-config-default)

(require 'ido)
(setq ido-enable-flex-matching t)
(ido-mode t)

(require 'xiaye-mode)
(require 'buffer-move)
(require 'expand-region)
;; (require 'go-mode-load)
;; (require 'pig-mode)

(require 'smex)
(require 'flycheck)

(smex-initialize)

(winner-mode 1)
(column-number-mode 1)
;; (global-visual-line-mode 1)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (org . t)
   (sqlite . t)
   (sql . t)
   (perl . t)
))

(global-set-key "\M-1" 'xiaye-mode)
;; (put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
