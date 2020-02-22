;;;; srfi-88.lisp

(cl:in-package "https://github.com/g000001/srfi-172#internals")


(in-syntax *srfi-172-internal*)


(defmacro eval-always (&body body)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@body))


(eval-always
  (defun srfi-172-prefix (srm chr)
    (declare (ignore chr))
    (let ((*package* (find-package
                      "https://github.com/g000001/srfi-172")))
      (read srm)))
  (set-macro-character #\~ #'srfi-172-prefix)
  (setf (macro-function '~letrec*)
        (macro-function '~letrec))
  (setf (macro-function '~delay-force)
        (macro-function 'lazy))
  (setf (fdefinition '~raise-continuable)
        (fdefinition '~raise)))


(#|vector|#)


(define (~vector-append . bvs)
  (apply #'concatenate 'cl:vector bvs))


(define ~vector-copy #'cl:copy-seq)


(define (~vector-for-each proc . vecs)
  (cl:apply #'cl:map nil proc vecs))


(define (~vector-map proc . vecs)
  (cl:apply #'cl:map 'vector proc vecs))


(defun ~string->vector (string &optional (start 0) end)
  (map 'vector #'identity (subseq string start end)))


(defun ~vector->string (string &optional (start 0) end)
  (coerce (subseq string start end) 'string))


(defun ~vector-copy! (to at from &optional (start 0) end)
  (setf (subseq to at)
        (subseq from start end))
  to)


(#|bytevector
   srfi-4 &...|#)


(deftype ~bytevector ()
    '(vector (unsigned-byte 8)))


(define (~bytevector-append . bvs)
  (apply #'concatenate '~bytevector
         bvs))


(eval-always
  (define ~make-bytevector #'srfi-4:make-u8vector)
  (define ~bytevector #'srfi-4:u8vector)
  (define ~bytevector? #'srfi-4:u8vector?)
  (define ~bytevector-u8-ref #'srfi-4:u8vector-ref)
  (define ~bytevector-length #'cl:length)
  (define ~bytevector-u8-set! #'srfi-4:u8vector-set!)
  (define ~bytevector-copy! #'~vector-copy!))


(defun ~bytevector-copy (vector &optional (start 0) end)
    (let* ((end (or end (length vector)))
           (bv (~make-bytevector (- end start))))
      (setq bv
            (subseq vector start end))
      bv))


(#|list|#)


(defun ~make-list (k fill)
  (make-list k :initial-element fill))


(defun ~list-set! (list k obj)
  (setf (elt list k) obj))


(defmacro ~when (pred &body body)
  `(cl:when ,pred . ,body))


(defmacro ~unless (pred &body body)
  `(cl:unless ,pred . ,body))


(eval-always
  (define ~list-copy #'cl:copy-list)
  (define ~call/cc #'rnrs:call-with-current-continuation))


(#|string|#)


(defun ~string->utf8 (string)
  (string-to-octets string :encoding :utf-8))


(defun ~utf8->string (bytevector)
  (octets-to-string bytevector :encoding :utf-8))


(#|math|#)


(define (~square n) (* n n))


(eval-always
  (define ~exact #'cl:rationalize)
  (define ~floor/ #'cl:floor)
  (define ~truncate/ #'cl:truncate)
  (define ~inexact (lambda (n) (float n 0d0))))


(define (~exact-integer? x)
  (or (integerp x)
      (integerp (rationalize x))))


(define (~floor-quotient n)
  (nth-value 0 (cl:floor n)))


(define (~floor-remainder n)
  (nth-value 1 (cl:floor n)))


(define (~truncate-quotient n)
  (nth-value 0 (cl:truncate n)))


(define (~truncate-remainder n)
  (nth-value 1 (cl:truncate n)))


(define (~exact-integer-sqrt k)
  (let* ((s (isqrt k))
         (r (- k (expt s 2))))
    (values s r)))


(#|io|#)


(define (~call-with-port port proc)
  (let ((res (funcall proc port)))
    (cl:close port)
    res))


(define (~close-port port)
  (close port))


(defun ~read-bytevector! (bytevector
                                  &optional (port *standard-input*)
                                    (start 0)
                                    end)
  (read-sequence bytevector port :start start :end end))


(defun ~read-bytevector (k &optional (port *standard-input*))
  (~read-bytevector! (~make-bytevector k)
                             port
                             0
                             k))


(defun ~read-u8 (&optional (port *standard-input*))
  (read-byte port nil (rnrs:eof-object)))


(defun ~read-line (&optional (port *standard-input*))
  (read-line port nil (rnrs:eof-object)))


(defun ~read-string (k &optional (port *standard-input*))
  (do* ((out (make-string-output-stream))
        (eof (rnrs:eof-object))
        (k k (1- k))
        (c (read-char port nil eof)
           (read-char port nil eof)))
       ((or (rnrs:eof-object? c)
            (zerop k))
        (get-output-stream-string out))
    (write-char c out)))


(defun ~textual-port? (port)
  (not (typep (stream-element-type port)
              'unsigned-byte)))


(defun ~error-object? (obj)
  (typep obj 'error))


(defun ~error-object-message (obj)
  (format nil
          (simple-condition-format-control obj)
          (simple-condition-format-arguments obj)))


(defun ~error-object-irritants (obj)
  (simple-condition-format-arguments obj))


(defun ~read-error? (obj)
  (typep obj 'reader-error))


(defun ~peek-u8 (&optional (port *standard-input*))
  (flex:peek-byte port nil nil (rnrs:eof-object)))


(defun ~get-output-bytevector (port)
  (flex:get-output-stream-sequence port))


(defun ~open-input-bytevector (bytevector)
  (flex:make-in-memory-input-stream bytevector))


(defun ~open-output-bytevector ()
  (flex:make-in-memory-output-stream :element-type
                                     '~bytevector))


(defun ~write-string (string &optional (port *standard-output*)
                                       (start 0)
                                       end)
  (write-string string port :start start :end end))


(defun ~write-bytevector (bytevector
                                  &optional (port *standard-output*)
                                    (start 0)
                                    end)
  (write-sequence bytevector port :start start :end end))


(defun ~write-u8 (byte &optional (port *standard-output*))
  (write-byte byte port))


(eval-always
  (define ~char-foldcase #'char-downcase))


(define (~string-foldcase s)
  (check-type s string)
  (string-downcase s))


(defun ~digit-value (char)
  (digit-char-p char 10.))


(defun ~symbol=? (x y &rest symbols)
  (let ((symbols (list* x y symbols)))
    (dolist (s symbols)
      (unless (and (symbolp s)
                   (not (keywordp s)))
        (error "symbol required, but got:" s))))
  (reduce #'eq symbols))


(defun ~infinite? (n)
  (and (floatp n)
       (float-features:float-infinity-p n)))


(defun ~finite? (n)
  (not (~infinite? n)))


(defun ~nan? (n)
  (and (floatp n)
       (float-features:float-nan-p n)))


(defun ~boolean=? (x y &rest booleans)
  (let ((booleans (list* x y booleans)))
    (dolist (b booleans)
      (unless (typep b 'boolean)
        (error "symbol required, but got:" b))))
  (reduce #'eq booleans))


(defun ~make-promise (obj)
  (box obj))


(defun ~promise? (obj)
  (and (weak-pointer-p obj)
       (listp (weak-pointer-value obj))))


(cl:in-package "https://github.com/g000001/srfi-46#internals")


(cl:defparameter srfi-172-builtins-store
  (let loop ((bs '(begin define define-syntax if lambda quote
                   set! delay let-syntax syntax-rules lambda))
	     (store empty-store))
    (if (null? bs)
	store
	(loop (cdr bs)
	   (extend-store store (car bs) (make-builtin (car bs)))))))


(cl:defparameter srfi-172-null-stuff
  (expand-top-level-forms null-prog srfi-172-builtins-store 0 #'list))


(cl:defparameter srfi-172-null-store  (cadr null-stuff))


(cl:defparameter srfi-172-null-loc-n  (cl:caddr null-stuff))


(define-function (srfi-172-null-mstore) (cons null-store null-loc-n))


(cl:defparameter *cl-define-syntax-mstore* (srfi-172-null-mstore))


;;; *EOF*
