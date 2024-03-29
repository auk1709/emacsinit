;;; code
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp" "conf" "public_repos")
(require 'package) ; package.el$B$rM-8z2=(B
;; $B%Q%C%1!<%8%j%]%8%H%j$K(BMarmalade$B$H(BMELPA$B$rDI2C(B
(add-to-list
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ; $B%$%s%9%H!<%k:Q$_$N(BElisp$B$rFI$_9~$`(B
(define-key global-map (kbd "C-m") 'newline-and-indent)
;; backspace
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;; help
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-t") 'other-window)
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(column-number-mode t)
(size-indication-mode t)
(display-time-mode t)
(display-battery-mode t)
(scroll-bar-mode -1) ;$B%9%/%m!<%k%P!<$r$J$/$9(B
(tool-bar-mode -1) ; $B%D!<%k%P!<$r$J$/$9(B
(menu-bar-mode -1) ; $B%a%K%e!<%P!<$r$J$/$9(B
;; $B%?%$%H%k%P!<$K%U%!%$%k$N%U%k%Q%9$rI=<((B
(setq frame-title-format "%f")
;; $B9THV9f$r>o$KI=<($9$k(B
(global-display-line-numbers-mode)
;; TAB$B$NI=<(I}(B
(setq-default tab-width 4)
(set-face-attribute 'default nil
					:family "Ricty Diminished"
					:height 120)
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)
;; paren-mode:$BBP1~$9$k3g8L$r6/D4$7$FI=<($9$k(B
(setq show-paren-delay 0) ; $BI=<($^$G$NIC?t!#=i4|CM$O(B0.125
(show-paren-mode t) ; $BM-8z2=(B
;; paren$B$N%9%?%$%k(B: expression$B$O3g8LFb$b6/D4I=<((B
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match nil)
(set-face-underline-p 'show-paren-match "darkgreen")
;; $B%P%C%/%"%C%W%U%!%$%k$N:n@.>l=j$r%7%9%F%`$N(BTemp$B%G%#%l%/%H%j$KJQ99$9$k(B
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
;; $B%*!<%H%;!<%V%U%!%$%k$N:n@.>l=j$r%7%9%F%`$N(BTemp$B%G%#%l%/%H%j$KJQ99$9$k(B
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" default)))
 '(package-selected-packages
   (quote
	(mozc-popup mozc-im mozc emmet-mode quickrun flycheck web-mode color-moccur auto-complete helm atom-dark-theme zenburn-theme multi-term htmlize))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; atom-dark$B%F!<%^$rMxMQ$9$k(B
(load-theme 'atom-dark t)
;; Helm
(require 'helm-config)
;; auto-complete$B$N@_Dj(B
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))
;; color-moccur$B$N@_Dj(B
(when (require 'color-moccur nil t)
  ;; M-o$B$K(Boccur-by-moccur$B$r3d$jEv$F(B
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; $B%9%Z!<%96h@Z$j$G(BAND$B8!:w(B
  (setq moccur-split-word t)
  ;; $B%G%#%l%/%H%j8!:w$N$H$-=|30$9$k%U%!%$%k(B
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))
;; cua-mode$B$N@_Dj(B
(cua-mode t) ; cua-mode$B$r%*%s(B
(setq cua-enable-cua-keys nil) ; CUA$B%-!<%P%$%s%I$rL58z$K$9$k(B
(when (require 'web-mode nil t)
  ;; $B<+F0E*$K(Bwen-mode$B$r5/F0$7$?$$3HD%;R$rDI2C$9$k(B
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  ;; web-mode$B$N%$%s%G%s%HMQ%U%C%/(B
  (defun web-mode-hook ()
	"Hooks for Web mode."
	(setq web-mode-code-indent-offset 4)
	)
  (add-hook 'web-mode-hook 'web-mode-hook)
  )
(add-hook 'after-init-hook #'global-flycheck-mode)
;; emmet setting
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode); web-mode$B5/F0;~(B
(add-hook 'sgml-mode-hook 'emmet-mode); $B$"$i$f$k%^!<%/%"%C%W8@8l(B
(add-hook 'css-mode-hook 'emmet-mode); css-mode$B5/F0;~(B 
;; $B%S!<%W2;$r>C$9(B
(setq visible-bell t)
;; $B3g8L<+F0Jd40(B
(electric-pair-mode 1)
;;; mozc
(require 'mozc)
(require 'mozc-im)
(require 'mozc-popup)
(require 'mozc-cursor-color)
(require 'wdired)

(setq default-input-method "japanese-mozc-im")

;; popup$B%9%?%$%k(B $B$r;HMQ$9$k(B
(setq mozc-candidate-style 'popup)

;; $B%+!<%=%k%+%i!<$r@_Dj$9$k(B
(setq mozc-cursor-color-alist '((direct        . "red")
                                (read-only     . "yellow")
                                (hiragana      . "green")
                                (full-katakana . "goldenrod")
                                (half-ascii    . "dark orchid")
                                (full-ascii    . "orchid")
                                (half-katakana . "dark goldenrod")))

;; $B%+!<%=%k$NE@LG$r(B OFF $B$K$9$k(B
(blink-cursor-mode 0)

;; C-o $B$G(B IME $B$r%H%0%k$9$k(B
(global-set-key (kbd "C-o") 'toggle-input-method)
(define-key isearch-mode-map (kbd "C-o") 'isearch-toggle-input-method)
(define-key wdired-mode-map (kbd "C-o") 'toggle-input-method)

;; mozc-cursor-color $B$rMxMQ$9$k$?$a$NBP:v(B
;; (defvar mozc-im-mode nil)
;; (make-variable-buffer-local 'mozc-im-mode)
(defvar-local mozc-im-mode nil)
(add-hook 'mozc-im-activate-hook (lambda () (setq mozc-im-mode t)))
(add-hook 'mozc-im-deactivate-hook (lambda () (setq mozc-im-mode nil)))
(advice-add 'mozc-cursor-color-update
            :around (lambda (orig-fun &rest args)
                      (let ((mozc-mode mozc-im-mode))
                        (apply orig-fun args))))

;; isearch $B$rMxMQ$9$kA08e$G(B IME $B$N>uBV$r0];}$9$k$?$a$NBP:v(B
(add-hook 'isearch-mode-hook (lambda () (setq im-state mozc-im-mode)))
(add-hook 'isearch-mode-end-hook
          (lambda ()
            (unless (eq im-state mozc-im-mode)
              (if im-state
                  (activate-input-method default-input-method)
                (deactivate-input-method)))))

;; wdired $B=*N;;~$K(B IME $B$r(B OFF $B$K$9$k(B
(advice-add 'wdired-finish-edit
            :after (lambda (&rest args)
                     (deactivate-input-method)))
;;;

