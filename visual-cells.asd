;;;; visual-cells.asd

(asdf:defsystem #:visual-cells
  :description "Display Lisp S-exp as tree of cons cells in a cario surface(pdf+png)."
  :author "cuichao <cuichaox@gmail.com>"
  :license "Specify license here"
  :serial t
  :depends-on (#:cl-cairo2)
  :components ((:file "package")
               (:file "src/visual-cells")))
