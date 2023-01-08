;;; early-config.el -*- coding: utf-8-unix; lexical-binding: t; -*-

;; This file will be loaded at the end of `early-init.el', it can be used to set
;; some early initialization stuff, or to set some MinEmacs variables, specially
;; these used in macros.

;; Set log level to `info' rather than `error'
(setq minemacs-msg-level 2)

;; Force loading lazy packages immediately, not in idle time
;; (setq minemacs-not-lazy t)

;; Setup a `debug-on-message' to catch a wired message!
;; (setq debug-on-message "Package cl is deprecated")
