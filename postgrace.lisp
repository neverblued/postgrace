(in-package #:postgrace)

(defparameter host "localhost")

(defparameter user "postgres")

(defparameter password-pathname "/home/lisp/.postgres.pwd")

(defun password ()
  (do () ((probe-file password-pathname)
          (values (pathname-content password-pathname)))
    (format t "~%Enter file containing database password pathname: ")
    (setf password-pathname (string (read)))))

(defun make-dao (type &rest args &key &allow-other-keys)
  "Эта функция должна быть в Postmodern согласно спецификации."
  (insert-dao (apply #'make-instance type args)))

(defun ensure-dao-tables (dao-names)
  (dolist (name dao-names)
    (unless (table-exists-p (symbol-keyword name))
      (execute (dao-table-definition name)))))
