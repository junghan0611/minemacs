;;; config.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Abdelhak Bougouffa

(message "MY-MINEMACS-KR-LOADING... START")
(add-to-list 'load-path "~/.spacemacs.d/lisp/")

(use-package unfill :straight t)
(use-package winum :straight t)

;; Personal info
(setq user-full-name "Junghan Kim"
      user-mail-address "junghanacs@gmail.com")
(setq auth-sources '("~/.authinfo.gpg"))
;; Set the default GPG key ID, see "gpg --list-secret-keys"
(setq-default epa-file-encrypt-to '("B5ADD9F47612A9DB"))

;; Line should be 80 characters wide, not 72 from corgi emacs
(setq-default
 ;; ====== Buffer-local variables ======
 ;; Display long lines
 truncate-lines nil
 ;; Default fill column width
 fill-column 80
 ;; Never mix, use only spaces
 indent-tabs-mode nil ;; Width for line numbers display-line-numbers-width 4
 ;; Small tab is enough!
 tab-width 2)
(setq inhibit-compacting-font-caches t)

;; Easily navigate sillycased words
(global-subword-mode 1)
;; Stop asking abount following symlinks to version controlled files
(setq vc-follow-symlinks t)

;; read 'The Forgotten History of the Blinking Cursor'
(blink-cursor-mode 1)

;; Disable .# lock files
(setq create-lockfiles nil)

;; Shr group: Simple HTML Renderer를 의미한다. 여기 설정을 바꾸면 faces를 수정할 수 있음
(setq shr-use-fonts nil)

;; UTF-8 :: defined in corgi-defaults.el
(setq default-input-method "korean-hangul")
(set-language-environment "Korean")
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

(global-set-key (kbd "<Hangul>") 'toggle-input-method)
(global-set-key (kbd "<S-SPC>") 'toggle-input-method)

(setq system-time-locale "C")

;; +------------+------------+
;; | 일이삼사오 | 일이삼사오 |
;; +------------+------------+
;; | ABCDEFGHIJ | ABCDEFGHIJ |
;; +------------+------------+
;; | 1234567890 | 1234567890 |
;; +------------+------------+
;; | 일이삼사오 | 일이삼사오 |
;; | abcdefghij | abcdefghij |
;; +------------+------------+

(defun my/korean-set-font-face()
  (interactive)
  (set-face-font 'fixed-pitch "Sarasa Term K")
  (set-face-font 'fixed-pitch-serif "KoPubWorldBatang")
  (set-face-font 'variable-pitch "Source Han Sans K VF")
  (set-face-attribute 'default nil :family "Sarasa Mono K" :height 136)
  (set-fontset-font t 'hangul (font-spec :family "Sarasa Mono K" :spacing 'm :size 13.5 :avgwidth 13.5)))

(add-hook 'minemacs-after-startup-hook 'my/korean-set-font-face)
(add-hook 'after-init-hook 'my/korean-set-font-face)

;; (add-hook 'enable-theme-functions 'my/korean-set-font-face)
;; Set fonts
(setq minemacs-fonts ;; or Cascadia Code, Fira Code, FiraCode Nerd Font, Iosevka Fixed Curly Slab
      '(:font-family "Sarasa Mono K" ;; "Iosevka Fixed Curly Slab"
        :font-size 13.5
        :variable-pitch-font-family "Source Han Sans K VF"
        :variable-pitch-font-size 13.5))

(setq-default line-spacing 3)
;; (setq minemacs-theme 'doom-homage-white)

;; (require 'corgi-stateline)
;; (global-corgi-stateline-mode)

;; If you installed Emacs from source, you can add the source code
;; directory to enable jumping to symbols defined in Emacs' C code.
;; (setq source-directory "~/Sources/emacs-git/")

;; I use Brave, and never use Chrome, so I replace chrome program with "brave"
;; (setq browse-url-chrome-program (or (executable-find "brave") (executable-find "chromium")))


;; Module: `me-natural-langs' -- Package: `spell-fu'
(with-eval-after-load 'spell-fu
  ;; We can use MinEmacs' helper macro `+spell-fu-register-dictionaries'
  ;; to enable multi-language spell checking.
  (+spell-fu-register-dictionaries "en" "ko"))

;; Module: `me-rss' -- Package: `elfeed'
(with-eval-after-load 'elfeed
  ;; Add news feeds for `elfeed'
  (setq elfeed-feeds
        '("https://itsfoss.com/feed"
          "https://lwn.net/headlines/rss"
          "https://linuxhandbook.com/feed"
          "https://www.omgubuntu.co.uk/feed"
          "https://this-week-in-rust.org/rss.xml"
          "https://planet.emacslife.com/atom.xml")))

;; Module: `me-email' -- Package: `mu4e'
;; (with-eval-after-load 'mu4e
;;   ;; Load personal aliases, a file containing aliases, for example:
;;   ;; alias gmail "Firstname Lastname <some.user.name@gmail.com>"
;;   ;; alias work  "Firstname Lastname <some.user.name@work.com>"

;;   ;; (setq mail-personal-alias-file (concat minemacs-config-dir "private/mail-aliases.mailrc"))

;;   ;; Register email accounts with mu4e

;;   (setq +mu4e-auto-bcc-address "always.bcc@this.email" ;; Add an email address always included as BCC
;;         +mu4e-gmail-accounts '(("account1@gmail.com" . "/gmail")
;;                                ("account@somesite.org" . "/gmail")))

;;   ;; Use MinEmacs' `+mu4e-register-account' helper function to register multiple accounts
;;   (+mu4e-register-account
;;    "Google mail" ;; Account name
;;    "gmail" ;; Maildir
;;    `((user-mail-address     . "account1@gmail.com")
;;      (mu4e-sent-folder      . "/gmail/Sent Mail")
;;      (mu4e-drafts-folder    . "/gmail/Drafts")
;;      (mu4e-trash-folder     . "/gmail/Trash")
;;      ;; These settings aren't mandatory if a `msmtp' config is used.
;;      (smtpmail-smtp-server  . "smtp.googlemail.com")
;;      (smtpmail-smtp-service . 587)
;;      ;; Define account aliases
;;      (+mu4e-account-aliases . ("account1-alias@somesite.org"
;;                                "account1-alias@othersite.org"))
;;      ;; Org-msg greeting and signature
;;      (org-msg-greeting-fmt  . "Hi%s,")
;;      ;; Generate signature
;;      (org-msg-signature     . ,(+org-msg-make-signature
;;                                 "Regards," ;; Closing phrase
;;                                 "Firstname" ;; First name
;;                                 "Lastname" ;; Last name
;;                                 "/R&D Engineer at Some company/")))))

;; 편집모드에서 빠져나갈때 한글이 켜져있으면 이후에 노멀 모드에서 커맨드가 안먹히는 짜증이 발생한다.
;; 그냥 편집모드에서 빠져나갈때 무조건 리셋시킨다. 엄청 편리함
(add-hook 'evil-insert-state-exit-hook (lambda ()
                                         (setq evil-input-method nil)))
;;; EVIL
;; Replace Emacs Tabs key bindings with Workspace key bindings
  (with-eval-after-load 'evil-maps ;; 편집 창 포커스 이동을 간단하게
    (define-key evil-normal-state-map (kbd "<SPC> <right> ") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "<SPC> <left> ") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "<SPC> <up> ") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "<SPC> <down> ") 'evil-window-down)


    ;; disable evil-mc key-binding with meta
    ;; (with-eval-after-load 'evil-mc
    ;;   (evil-define-key '(insert normal visual) evil-mc-key-map (kbd "M-n") nil)
    ;;   (evil-define-key '(insert normal visual) evil-mc-key-map (kbd "M-p") nil)
    ;;   (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-n") nil)
    ;;   (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-p") nil)
    ;;   (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-t") nil)
    ;;   (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-M-j") nil)
    ;;   (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-M-k") nil)
    ;;   )

    ;; overide better-defaults layer configuration
    (define-key evil-normal-state-map (kbd "C-a") 'evil-beginning-of-line)
    (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line-or-visual-line)
    (define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-line)
    (define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line-or-visual-line)
    ;; =C-w= 'insert 'evil-delete-backward-word
    ;; =C-w= 'visual 'evil-window-map

    (global-set-key (kbd "M-q") 'fill-paragraph)
    (global-set-key (kbd "C-M-q") 'unfill-paragraph)

    ;; copy from DW
    (defun dw/dont-arrow-me-bro ()
      (interactive)
      (message "Arrow keys are bad, you know?"))

    ;; Disable arrow keys in normal and visual modes
    (define-key evil-normal-state-map (kbd "<left>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<right>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<down>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<up>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<left>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<right>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<down>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<up>") 'dw/dont-arrow-me-bro)

    ;; C-g 기본 함수는 keyboard-quit
    ;; C-g back to normal state
    ;; (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
    )
;; windows 1-6
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)
(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-5") 'winum-select-window-5)
(global-set-key (kbd "M-6") 'winum-select-window-6)

;; show major-mode keymap
(global-set-key (kbd "M-<RET>") 'which-key-show-major-mode)
;; (global-set-key (kbd "M-<RET>") 'cider-eval-last-sexp)

;; Info 모드 Node 이동
;; (define-key Info-mode-map (kbd "C-p") 'Info-prev)
;; (define-key Info-mode-map (kbd "C-n") 'Info-next)

;; undo-fu
(define-key evil-normal-state-map (kbd "u") 'undo-fu-only-undo)
(define-key evil-normal-state-map (kbd "\C-r") 'undo-fu-only-redo)

(global-set-key (kbd "C-c j b") 'org-babel-tangle)
(global-set-key (kbd "C-c j j") 'org-journal-new-entry)

;; (setq multi-term-program "/usr/bin/zsh")

(global-visual-line-mode 1)

(with-eval-after-load 'evil-escape
        (setq-default evil-escape-key-sequence ",.")
        (setq-default evil-escape-unordered-key-sequence nil)
        (setq-default evil-escape-delay 1.0) ;; 0.5, default 0.1
        (evil-escape-mode)
        )

(with-eval-after-load 'vertico
  (evil-global-set-key 'normal "." 'consult-line)
  )

(message "MY-WORKFLOW-KR-LOADING... START")

;; Module: `me-org' -- Package: `org'
(with-eval-after-load 'org
  ;; Set Org-mode directory
  (use-package org-agenda
    :straight (:type built-in))

  (use-package org-journal
    :straight t
    )
  (use-package bbdb
    :straight t
    )
  (use-package org-pomodoro
    :straight t
    )

  (require 'my-org-common)
  (require 'org-workflow)

  ;; add-hook
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  )
(message "MY-WORKFLOW-KR-LOADING... DONE")

;; Module: `me-notes' -- Package: `org-roam'
(with-eval-after-load 'org-roam
  (setq org-roam-directory "~/sync/org/roam/")

  ;; Register capture template (via Org-Protocol)
  ;; Add this as bookmarklet in your browser
  ;; javascript:location.href='org-protocol://roam-ref?template=r&ref=%27+encodeURIComponent(location.href)+%27&title=%27+encodeURIComponent(document.title)+%27&body=%27+encodeURIComponent(window.getSelection())
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain "%?"
           :if-new (file+head "web/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+created: %U\n\n${body}\n")
           :unnarrowed t))))

;; Module: `me-media' -- Package: `empv'
;; (with-eval-after-load 'empv
;;   ;; Set the radio channels, you can get streams from https://www.radio-browser.info
;;   (setq empv-radio-channels
;;         '(("El-Bahdja FM" . "http://webradio.tda.dz:8001/ElBahdja_64K.mp3")
;;           ("El-Chaabia" . "https://radio-dzair.net/proxy/chaabia?mp=/stream")
;;           ("Quran Radio" . "http://stream.radiojar.com/0tpy1h0kxtzuv")
;;           ("Algeria International" . "https://webradio.tda.dz/Internationale_64K.mp3")
;;           ("JOW Radio" . "https://str0.creacast.com/jowradio")
;;           ("Europe1" . "http://ais-live.cloud-services.paris:8000/europe1.mp3")
;;           ("France Iter" . "http://direct.franceinter.fr/live/franceinter-hifi.aac")
;;           ("France Info" . "http://direct.franceinfo.fr/live/franceinfo-hifi.aac")
;;           ("France Culture" . "http://icecast.radiofrance.fr/franceculture-hifi.aac")
;;           ("France Musique" . "http://icecast.radiofrance.fr/francemusique-hifi.aac")
;;           ("FIP" . "http://icecast.radiofrance.fr/fip-hifi.aac")
;;           ("Beur FM" . "http://broadcast.infomaniak.ch/beurfm-high.aac")
;;           ("Skyrock" . "http://icecast.skyrock.net/s/natio_mp3_128k"))
;;         ;; See https://docs.invidious.io/instances/
;;         empv-invidious-instance "https://invidious.projectsegfau.lt/api/v1"))

(message "MY-MINEMACS-KR-LOADING... DONE")
