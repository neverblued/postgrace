;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:postgrace)

(defparameter host "localhost")

(defparameter user "postgres")

(defparameter password-pathname "/home/lisp/.postgres.pwd")

(defun password ()
  (do () ((probe-file password-pathname)
          (values (pathname-content password-pathname)))
    (format t "~%Enter database password file pathname: ")
    (setf password-pathname (string (read)))))

(defmacro with-database (database &body body)
  `(aif ,database
        (with-connection (list it postgrace::user (postgrace::password) postgrace::host)
          ,@body)
        (error "need database")))
