;(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t
      blink-cursor-mode nil)

(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default whitespace-style
              '(face spaces empty tabs trailing space-mark tab-mark))
(global-whitespace-mode 1)


;; THEME
(use-package catppuccin-theme
             :config
             (setq catppuccin-flavor 'mocha)
             (catppuccin-reload))


(use-package evil
             :config
             (evil-set-undo-system 'undo-redo)
             (evil-mode 1))

(use-package evil-leader
             :config
             (global-evil-leader-mode))

(use-package which-key
             :init (which-key-mode))

(use-package lsp-mode
             :commands (lsp lsp-deferred)
             :hook ((prog-mode . lsp))
             :config
             (setq gc-cons-threshold (* 100 1024 1024))   ;100mib
             (setq read-process-output-max (* 1024 1024)) ;1mib
             (lsp-enable-which-key-integration t))

(use-package lsp-ui
             :hook (lsp-mode . lsp-ui-mode))
