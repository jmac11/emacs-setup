(provide 'mine-windows)

(setq doc-view-ghostscript-program "C:/Program Files/gs/gs8.70/bin/gswin32c.exe")

(setq exec-path (append exec-path '("c:/tools/bin")))

(setenv "PATH" (concat "c:/cygwin/bin;" (getenv "PATH")))
(setq exec-path (cons "c:/cygwin/bin/" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)

;; Display ansi color escape sequences
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(set-face-font 'default "-*-Anonymous Pro-bold-normal-normal-*-*-*-*-*-m-0-iso10646-1")