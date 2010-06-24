
(defun sql-connection-profiles ()
	"Display sql connection profiles"
	(interactive)
	(find-file (concat (getenv "HOME") "/org/sql.org")))

(defun mine-mysql (user password host database)
  (let ((sql-user user)
        (sql-password password)
        (sql-server host)
        (sql-database database)
        (sql-buffer-name (concat "*SQL*:" database ":" host)))
    (when (not (get-buffer sql-buffer-name))
      (call-interactively 'sql-mysql)
      (rename-buffer sql-buffer-name))
    (delete-other-windows)
    (switch-to-buffer sql-buffer-name)
    (split-window-vertically)
    (find-file (concat (getenv "HOME") "/Documents/sql-scripts/" database "_" host ".sql"))))

(provide 'mine-sql)