# visual-cells
Display Lisp S-exp as tree of cons cells in a cario surface(pdf+png).

Quick Guide
===
;Download File 'src/visual-cells.lisp' in this repository. put it in current directory.<br>
;Load 'visual-cells.lisp' to your lisp image. For example : <br>
```lisp
  (load "visual-cells.lisp")
```
To display  the  alist : ((a . 1) (b . 2) (c . 3)) to the 'alist.pdf' and 'alist.png'<br>
```lisp
  (visual-cells:fvs '((a . 1) (b . 2) (c . 3)) "test")
```
The alist.png as floowing<br>
![alist.png](https://raw.githubusercontent.com/cuichaox/visual-cells/master/demo/alist.png "((a . 1) (b . 2) (c . 3))")

Call visual-cells in Slime
===
Add following line to your common lisp startup script. (eg: ~/.sbclrc)<br>
```lisp
    (load "/path-to/visual-cells.lisp") ; Change "/path-to/" to your directory.
```
Add following lines to your emacs startup file.(eg: ~/.emacs)<br>
```lisp
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
```
Start your Emacs and  run slime, Open a lisp file in 'slime-mode'.<br>
Move the point to end of a s-expresion, press "Ctrl+C V", the graphical display of the s-expression  will open  in Eamcs .<br>

[slime-screen](https://raw.githubusercontent.com/cuichaox/visual-cells/ad37f7656be4544b69d6eb19868df7e5f6a84129/demo/slime-screenshot.jpg "slime-screen")

To do
===
Specific  topology and sttyle  for more Lisp data type, such as Hash, Alist, Plist etc.
