;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:postgrace)

(defparameter host "localhost")

(defparameter user "postgres")

(defparameter password-pathname
  ".postgres.pwd")

(defun password-pathname ()
  (merge-pathnames (user-homedir-pathname)
                   password-pathname))

(defun input-password-pathname ()
  (format t "~%Где в домашней папке файл с паролем базы данных? - ")
  (setf password-pathname (string (read))))

(define-symbol-macro password
    (iter (awith (password-pathname)
            (if (probe-file it)
                (leave (values (pathname-content it)))
                (input-password-pathname)))))

(defmacro with-database (database &body body)
  `(aif ,database
        (with-connection (list it
                               postgrace::user
                               postgrace::password
                               postgrace::host)
          ,@body)
        (error 'database-connection-error
               :message "база данных не определена")))
