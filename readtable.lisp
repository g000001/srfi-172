(cl:in-package "https://github.com/g000001/srfi-172#internals")


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *srfi-172* (copy-readtable (find-readtable :rnrs)))
  (defconstant srfi-172-syntax *srfi-172*)
  (setf (find-readtable :srfi-172) srfi-172-syntax)
  (defvar *srfi-172-internal*
    (copy-readtable srfi-172-syntax)))


(defmacro in-syntax (rt)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (setq *readtable* ,rt)))


;;; *EOF*


