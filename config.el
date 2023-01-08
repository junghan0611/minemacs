;;; config.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Abdelhak Bougouffa

;; Personal info
(setq user-full-name "Junghan Kim"
      user-mail-address "junghanacs@gmail.com")

;; Set the default GPG key ID, see "gpg --list-secret-keys"
(setq-default epa-file-encrypt-to '("B5ADD9F47612A9DB"))

(setq utf-translate-cjk-mode nil)       ; disable CJK coding/encoding

(setq default-input-method "korean-hangul")
(set-language-environment "Korean")
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system  'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)

(global-set-key (kbd "<S-SPC>") 'toggle-input-method)
;; (global-set-key (kbd "<Alt_R>") 'toggle-input-method)
(global-set-key (kbd "<Hangul>") 'toggle-input-method)
;; (global-unset-key (kbd "S-SPC"))

;; Set fonts
(setq minemacs-fonts ;; or Cascadia Code, Fira Code, FiraCode Nerd Font, Iosevka Fixed Curly Slab
      '(:font-family "Sarasa Mono K Nerd Font" ;; "Iosevka Fixed Curly Slab"
        :font-size 13.5
        :variable-pitch-font-family "Source Han Sans K VF"
        :variable-pitch-font-size 13.5))

(setq-default line-spacing 3)

;; (setq minemacs-theme 'doom-homage-white)

;;  *한영 자간 확인*
;;  +------------+------------+
;;  | 일이삼사오 | 일이삼사오 |
;;  | abcdefghij | abcdefghij |
;;  +------------+------------+)

(defun my/korean-set-font-face()
  (interactive)
  (set-face-font 'fixed-pitch "Sarasa Mono K Nerd Font")
  (set-face-font 'fixed-pitch-serif "KoPubWorldBatang")
  (set-face-font 'variable-pitch "Source Han Sans K VF")
  (set-face-attribute 'default nil :family "Sarasa Mono K Nerd Font" :height 136)
  (set-fontset-font t 'hangul (font-spec :family "Sarasa Mono K Nerd Font" :spacing 'm :size 13.5 :avgwidth 13.5)))

(add-hook 'minemacs-after-startup-hook 'my/korean-set-font-face)
(add-hook 'after-init-hook 'my/korean-set-font-face)
;; (add-hook 'enable-theme-functions 'my/korean-set-font-face)

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

;; Module: `me-org' -- Package: `org'
(with-eval-after-load 'org
  ;; Set Org-mode directory
  (setq org-directory "~/sync/org/") ; let's put files here
  (setq org-workflow-directory "~/sync/org/workflow/") ; let's put files here
  (setq org-default-notes-file (concat org-workflow-directory "refile.org"))
  ;; Customize Org stuff
  ;; (setq org-todo-keywords
  ;;       '((sequence "IDEA(i)" "TODO(t)" "NEXT(n)" "PROJ(p)" "STRT(s)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
  ;;         (sequence "[ ](T)" "[-](S)" "|" "[X](D)")
  ;;         (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))

  (setq org-export-headline-levels 5)

  ;; Your Org files to include in the agenda
  (setq org-agenda-files
        (mapcar
          (lambda (f) (concat org-workflow-directory f))
          '("refile.org"
            "diary.org"
            "Emacs.org"
            "Project.org"
            "personal.org"
            "Junghanacs.org"))))

;; Module: `me-notes' -- Package: `org-roam'
(with-eval-after-load 'org-roam
  (setq org-roam-directory "~/sync/org/roam/"
        org-roam-db-location (concat org-roam-directory "org-roam.db"))

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
