;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:postgrace-system
  (:use #:common-lisp #:asdf))

(in-package #:postgrace-system)

(defsystem "postgrace"
  :description "Sugar over Postmodern"
  :version "0.1"
  :author "Дмитрий Пинский <demetrius@neverblued.info>"
  :depends-on (#:postmodern #:blackjack)
  :serial t
  :components ((:file "package")
               (:file "authentication")
               (:file "dao")))
