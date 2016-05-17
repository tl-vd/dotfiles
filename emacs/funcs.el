(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key "\C-a" 'smart-beginning-of-line)


(defun newline-below ()
  (interactive)
  (end-of-line)
  (newline)
  )
(global-set-key [(shift return)] 'newline-below)


(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
 (filename (buffer-file-name)))
    (if (not filename)
 (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
   (message "A buffer named '%s' already exists!" new-name)
 (progn
   (rename-file name new-name 1)
   (rename-buffer new-name)
   (set-visited-file-name new-name)
   (set-buffer-modified-p nil))))))

(defun shell-command-on-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")
   t
   t))
(global-set-key (kbd "M-\"") 'shell-command-on-buffer)

(defun blockfmt-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   "/home/markus/bin/blockfmt"
   t
   t))
(global-set-key (kbd "M-\\") 'blockfmt-buffer)


; Explicit hungry delete
;(defvar hungry-delete-whitespace-chars " `\n'`\t'`\r'")
;
;(defun backward-char-skip-whitespace ()
;  (interactive)
;  (while (progn
;           (skip-chars-backward hungry-delete-whitespace-chars)
;           (and (eolp)
;                (eq (char-before) ?\\)))
;    (backward-char))
;  (while (get-text-property (point) 'read-only)
;    (forward-char)))

(defun backward-delete-ws-iter ()
  (let ((no_ws nil))
  (while (or (eq (char-before) ? )
             (eq (char-before) ?\n)
             (eq (char-before) ?\t)
             (eq (char-before) ?\r))
    ;(message "dc-1")
    (setq no_ws t)
    (delete-char -1))
  no_ws))

(defun hungry-backward-delete-char ()
  (interactive)
  (if (not (backward-delete-ws-iter))
      (delete-char -1)
    t))
 
  
(defun hungry-backward-kill-word ()
  (interactive)
  (if (eq (char-before) ? ) (delete-char -1))
  (if (not (backward-delete-ws-iter))
      (backward-kill-word 1)
    t))
  ;(let ((here (point)))
  ;  (if (eq (skip-chars-backward " `\n'`\t'`\r'") 0)
  ;      (backward-kill-word 1)
  ;    (delete-region (point) here))))

(provide 'funcs);



