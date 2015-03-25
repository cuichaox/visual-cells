;; function to call by emacs
(defun visual-exp ()
  (interactive)
  (slime-eval `(swank:eval-and-grab-output
		,(concat "(visual-cells::fvs '"
			 (slime-last-expression)
			 "\"/tmp/vs.out\")")))
  (let* ((o-buffer-name "*visual-cells-output*")
	 (o-buffer (get-buffer o-buffer-name)))
    (when o-buffer (kill-buffer o-buffer))
    (find-file-read-only-other-window "/tmp/vs.out.png")
    (rename-buffer "*visual-cells-output*")))
;; set key binding for slime mode
(global-auto-revert-mode 1)
(add-hook 'slime-mode-hook
	  '(lambda ()
	     (define-key slime-mode-map "\C-cv" 'visual-exp)))
	  


