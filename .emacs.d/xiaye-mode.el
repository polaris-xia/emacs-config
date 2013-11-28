(defun clear-line ()
  (interactive)
  (back-to-indentation)
  (kill-line))

(defun open-new-line ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun mark-defun ()
  (interactive)
  (move-end-of-line nil)
  (beginning-of-defun)
  (set-mark-command nil)
  (end-of-defun))

(defun make-clean ()
  (interactive)
  (compile "make clean"))

(defun scroll-other-window-up-line ()
  (interactive)
  (scroll-other-window 1)
)

(defun scroll-other-window-down-line ()
  (interactive)
  (scroll-other-window-down 1)
)

(define-minor-mode xiaye-mode
  "Xia Ye Mode!"
  t
  " Xiaye"
  '(("\M-j" . backward-char)
    ("\M-l" . forward-char)
    ("\M-i" . previous-line)
    ("\M-k" . next-line)
    ("\M-u" . backward-word)
    ("\M-o" . forward-word)
    ("\M-h" . move-beginning-of-line)
    ("\M-'" . move-end-of-line)
    ("\M-/" . er/expand-region)
    ("\M- " . set-mark-command)

    ;; ("\M-d" . backward-delete-char-untabify)
    ;; ("\M-f" . delete-char)
    ;; ("\M-e" . backward-kill-word)
    ;; ("\M-r" . kill-word)
    ("\M-2" . kill-whole-line)
    ("\M-3" . kill-line)
  
    ("\M-x" . smex)
    ("\M-a" . undo)

    ("\C-cwj" . shrink-window-horizontally)
    ("\C-cwl" . enlarge-window-horizontally)
    ("\C-cwi" . shrink-window)
    ("\C-cwk" . enlarge-window)
    ("\C-cwn" . winner-redo)
    ("\C-cwp" . winner-undo)
    
    ("\C-cc" . compile)
    
    ("\C-cbj" . buf-move-left)
    ("\C-cbl" . buf-move-right)
    ("\C-cbi" . buf-move-up)
    ("\C-cbk" . buf-move-down)
    ("\C-cbp" . switch-to-prev-buffer)
    ("\C-cbn" . switch-to-next-buffer)

    ("\C-ch" . hs-hide-all)
    ("\C-cs" . hs-show-all)
    ("\C-ct" . hs-toggle-hiding)
    ("\C-co" . ff-find-other-file)
    ("\C-cg" . grep-find)
    ("\C-cl" . open-new-line)

    ("\C-cm" . mark-defun)
    
    ("\M-sc" . multi-term)
    ("\M-sn" . multi-term-next)
    ("\M-sp" . multi-term-prev)

    ("\M-?" . man))

  

  :global nil
)

(provide 'xiaye-mode)

