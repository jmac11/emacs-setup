(require 'multi-shell)

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(setq multi-shell-command "zsh"
      multi-shell-revert-window-after-complete nil)

(global-set-key (kbd "C-c t") 'multi-shell-next)
(global-set-key (kbd "C-c T") 'multi-shell-new)

(add-hook 'shell-mode-hook 'n-shell-mode-hook)

(defun n-shell-mode-hook ()
  "shell mode customizations."
  (local-set-key '[up]          'comint-previous-input)
  (local-set-key '[down]        'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  (setq comint-input-sender     'n-shell-simple-send))

(defun n-shell-simple-send (proc command)
  "Various commands pre-processing before sending to shell."
  (cond
   ;; checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\n")
    (erase-buffer))

   ;; checking for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (funcall 'man command))

   ;; send other commands to the default handler.
   (t (comint-simple-send proc command))))

(provide 'mine-shell)