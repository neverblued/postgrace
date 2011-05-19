(defpackage #:postgrace-system
  (:use #:common-lisp #:asdf))

(in-package #:postgrace-system)

(defsystem "postgrace"
  :description "Sugar over Postmodern"
  :version "0.1"
  :author "Demetrius Conde <condemetrius@gmail.com>"
  :depends-on (#:postmodern)
  :serial t
  :components ((:file "package")
               (:file "postgrace")))
