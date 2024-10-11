;; 关闭emacs前询问是否确认关闭
(setq confirm-kill-emacs #'yes-or-no-p)

;; 自动补全括号
(electric-pair-mode t)

;; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook 'show-paren-mode)

;; 在mode line上显示列号
(column-number-mode t)

;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(global-auto-revert-mode t)

;; 关闭文件的自动备份
(setq make-backup-files nil)  ;; 修正了这里的拼写错误

;; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook 'hs-minor-mode)  ;; 修正了多余的引号

;; 配置源

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http:///mirrors.tuna.tsinghua.edu.cn/elpa/melpa")))


(package-initialize)

;; 防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; modeline上显示我的所有的按键和执行的命令
;;(unless (package-installed-p 'keycast)  ;; 检查包是否已安装
;;  (package-install 'keycast))
;;(keycast-mode t)

;; 增强minibuffer补全: vertico和Orderless
(unless (package-installed-p 'vertico)
  (package-install 'vertico))
(vertico-mode t)

(unless (package-installed-p 'orderless)
  (package-install 'orderless))
(setq completion-styles '(orderless))

;; 配置marginalia增强minubuffer的annotation
(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))
(marginalia-mode t)

;; minibuffer action 和自适应的 context menu：Embark
(unless (package-installed-p 'embark)
  (package-install 'embark))
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

;; 增强文件内搜索和跳转函数定义：Consult
(unless (package-installed-p 'consult)
  (package-install 'consult))
(global-set-key (kbd "C-s") 'consult-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(consult embark marginalia orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
