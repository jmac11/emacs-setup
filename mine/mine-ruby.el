
(add-path "site-lisp/rinari")

(require 'rinari)
(require 'ruby-electric)

(case system-type
  ('darwin (require 'rvm)
					 (rvm-use-default)))

;;File type associations 
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))

(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; autotest setup
(autoload 'autotest "autotest" "Run autotest" t)
(setq autotest-use-ui t)

(defun autotest-rspec ()
  "Runs autotest as rspec enabled"
  (interactive)
  (setq autotest-command "RSPEC=true autotest")
  (autotest)
  (setq autotest-command "autotest"))

(defun autotest-rspec-with-features ()
  "Runs autotest as rspec and cucumber features enabled"
  (interactive)
  (setq autotest-command "AUTOFEATURE=true RSPEC=true autotest")
  (autotest)
  (setq autotest-command "autotest"))

(autoload 'feature-mode "feature-mode" "Major mode for editing plain text stories" t)
(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))
(define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)

(provide 'mine-ruby)