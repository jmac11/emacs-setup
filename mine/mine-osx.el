
;; Additional pathing for OSX
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))


(setq doc-view-ghostscript-program "/usr/local/bin/gs")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(ansi-color-for-comint-mode-on)

(menu-bar-mode t)

(setq ns-command-modifier 'meta)

(provide 'mine-osx)