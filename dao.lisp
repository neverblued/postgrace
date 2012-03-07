(in-package #:postgrace)

(defun make-dao (type &rest args &key &allow-other-keys)
  "Эта функция должна быть в Postmodern согласно спецификации."
  (insert-dao (apply #'make-instance type args)))

(defun ensure-dao-tables (dao-names)
  (dolist (name dao-names)
    (unless (table-exists-p (symbol-keyword name))
      (execute (dao-table-definition name)))))
