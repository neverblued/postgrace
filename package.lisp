;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:postgrace
  (:use #:common-lisp #:postmodern
        #:blackjack)
  (:export
                                        ; authentication
   #:with-database
                                        ; dao
   #:ensure-dao-tables #:make-dao

   ))
