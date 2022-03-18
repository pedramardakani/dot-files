(add-to-list 'load-path "~/.emacs.d/lisp/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-scroll-output t)
 '(custom-enabled-themes '(misterioso))
 '(fill-column 75)
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(irony-completion-trigger-commands
   '(self-insert-command newline-and-indent c-context-line-break c-scope-operator c-electric-backspace c-electric-brace c-electric-colon c-electric-lt-gt c-electric-paren c-electric-pound c-electric-semi&comma c-electric-slash c-electric-star))
 '(menu-bar-mode nil)
 '(org-agenda-files
   '("~/w/ipm-docs/parklight.org" "~/w/ipm-docs/gnuastro.org" "~/w/ipm-docs/inola.org" "~/w/ipm-docs/projects.org" "~/w/ipm-docs/meetings.org" "~/w/ipm-docs/daily-report.org"))
 '(org-export-backends '(beamer html icalendar latex md odt))
 '(package-selected-packages '(flycheck multiple-cursors))
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))





;; Font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 140 :width normal)))))

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)





;;
;; Org mode configuration
;;
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "WAIT(w)" "DONE(d)")))

;; Create tags using C-c C-c in headlines (org-mode)
(setq org-tag-alist
      '(
        ("gnuastro"   . ?a)
        ("blog"       . ?b)
        ("ComputerScience" . ?c)
        ("django"     . ?d)
        ("emacs"      . ?e)
        ("inola"      . ?i)
        ("GNU/Linux"  . ?g)
        ("laravel"    . ?l)
        ("react"      . ?r)
))

;; Hide tasks that are scheduled in the future.
;;'(org-agenda-todo-ignore-scheduled 'future)

;; Manually set warning dates for scheduled agenda
'(org-agenda-skip-deadline-prewarning-if-scheduled t)

;; Bind keys to use for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)





;; To set the GUI window size and location in pixels (for a HD screen).
(when window-system
  (setq frame-resize-pixelwise t)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 650 1000 t))

;; Activate the appointments (this has to be close to the end).
(appt-activate)

;; Enable MELPA (Milkypostman’s Emacs Lisp Package Archive)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; The Multiple cursors package and its key bindings.
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Update the PATH so we can use it within 'compile'
(setenv "PATH"
        (concat
         (getenv "HOME")"/.local/bin" ":"
         (getenv "PATH")
        )
        )

;; Update the INFOPATH
;; Update the PATH so we can use it within 'compile'
(setenv "INFOPATH"
        (concat
         "/usr/share/info" ":"
         "/usr/local/share/info" ":"
         (getenv "HOME")"/.local/share/info"
        )
)
