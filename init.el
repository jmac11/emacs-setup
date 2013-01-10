(defvar emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(defun add-path (path)
  (add-to-list 'load-path (concat emacs-root path)))

(add-path "mine")
(add-path "site-lisp")

(require 'cl)
(require 'mine-navigation)
(require 'mine-customizations)
(require 'mine-defuns)
(require 'mine-advice)
(require 'mine-bindings)
(require 'mine-package)
(require 'mine-el-get)
(require 'mine-pretty)
(require 'mine-erc)
(require 'mine-dired)
(require 'mine-shell)
(require 'mine-html)
(require 'mine-csharp)
(require 'mine-ruby)
(require 'mine-javascript)
(require 'mine-haskell)
(require 'mine-c)
(require 'mine-bookmark)

(case system-type
  ('windows-nt (require 'mine-windows))
  ('darwin (require 'mine-osx)))

(setq debug-on-error nil)

(cd "~/")
(mine-server-start)

(message (format "emacs loaded in %.1f seconds"
                 (float-time
                  (time-subtract (current-time) before-init-time))))
