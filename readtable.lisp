(cl:in-package "https://github.com/g000001/srfi-172#internals")

(defmacro eval-always (&body body)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@body))


(eval-always
  (defvar *srfi-172* (copy-readtable (find-readtable :rnrs)))
  (defconstant srfi-172-syntax *srfi-172*)
  (setf (find-readtable :srfi-172) srfi-172-syntax)
  (defvar *srfi-172-internal*
    (copy-readtable srfi-172-syntax)))


(defmacro in-syntax (rt)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (setq *readtable* ,rt)))


(defun srfi-172-prefix (srm chr)
    (declare (ignore chr))
    (let ((*package* (find-package
                      "https://github.com/g000001/srfi-172")))
      (read srm)))

  
(cl:set-macro-character #\~ #'srfi-172-prefix T *srfi-172-internal*)


;;; *EOF*


