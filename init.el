;; init.el --- MinEmacs -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Abdelhak Bougouffa

;; Author: Abdelhak Bougouffa <abougouffa@fedoraproject.org>

(defvar minemacs-core-modules
 '(bootstrap defaults keybindings evil completion))

(defvar minemacs-modules
  '(ui editor vc prog lisp data
       org notes email docs spell
       files tools biblio daemon rss))

(defun minemacs-reload (&optional without-core)
  "Reload all configuration, including user's config.el."
  (interactive)
  ;; Core modules
  (unless without-core
    (dolist (module (mapcar #'symbol-name minemacs-core-modules))
      (me-log! "Loading core module \"%s\"" module)
      (load (expand-file-name (format "core/me-%s.el" module) minemacs-config-dir) nil t)))

  ;; Modules
  (dolist (module (mapcar #'symbol-name minemacs-modules))
    (me-log! "Loading module \"%s\"" module)
    (load (expand-file-name (format "lisp/me-%s.el" module) minemacs-config-dir) nil t))

  ;; Load user config when available
  (let ((user-config (expand-file-name "config.el" minemacs-config-dir)))
    (when (file-exists-p user-config)
      (me-log! "Loading user config file from \"%s\"" user-config)
      (load user-config))))

;; Load for the first time
(minemacs-reload)

(me-log! "Loaded early-config.el")
