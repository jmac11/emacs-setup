
;; misc
(global-set-key "\r"        'newline-and-indent)
(global-set-key "\C-a"      'beginning-of-line-or-back-to-indention)
(global-set-key "\C-cv"     'mine-toggle-transparency)
(global-set-key "\C-cw"     'toggle-truncate-lines)
(global-set-key "\C-cs"     'ido-goto-symbol)
(global-set-key "\C-cp"     'mine-goto-symbol-at-point)
(global-set-key "\M-g"      'goto-line)
(global-set-key "\C-c\o"    'cleanup-buffer)
(global-set-key "\C-c\m"    'magit-status)
(global-set-key "\C-x\C-p"  'find-file-at-point)
(global-set-key "\C-x\C-d"  'dired)
(global-set-key "\C-c2"     'swap-windows)
(global-set-key "\C-c3"     'rotate-window-split)
(global-set-key (kbd "C-c r") 'replace-string)

;; quick switch buffers
(global-set-key [(control tab)] 'bury-buffer)
(global-set-key [(control shift tab)] '(lambda ()
                                         (interactive)
                                         (switch-to-buffer (car (last (buffer-list))))))
;; extend search to show occurances
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


;; window resizing
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)

;; diff the current buffer with the file contents
(global-set-key (kbd "C-c d")
                (lambda () (interactive) (diff-buffer-with-file (current-buffer))))

(provide 'mine-bindings)
