(defpackage #:postgrace
  (:use #:common-lisp #:blackjack #:postmodern)
  (:export #:ensure-dao-tables #:make-dao))