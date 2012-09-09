;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:postgrace)

(defun row-max (table &key (key 'id))
  (let ((max (query (:select (:max key) :from table) :single)))
    (if (eql max :null) 0 max)))

(defun row-max+1 (table &key (key 'id))
  (1+ (row-max table :key key)))
