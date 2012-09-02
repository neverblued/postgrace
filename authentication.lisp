;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:postgrace)

(defparameter host "localhost")

(defparameter user "postgres")

(defgeneric password ())

(defmacro with-database (database &body body)
  `(aif ,database
        (with-connection (list it
                               postgrace::user
                               (postgrace::password)
                               postgrace::host)
          ,@body)
        (error 'database-connection-error
               :message "база данных не определена")))
