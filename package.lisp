;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-172"
  (:use
   "https://github.com/g000001/srfi-0"
   "https://github.com/g000001/srfi-13"
   "https://github.com/g000001/srfi-23"
   "https://github.com/g000001/srfi-39"
   "https://github.com/g000001/srfi-45"
   "https://github.com/g000001/srfi-6"
   quasiquote1
   srfi-11
   srfi-16
   srfi-34
   rnrs
   babel)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-45"
   force delay)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-23"
   error)
  (:shadowing-import-from quasiquote1 quasiquote)
  (:shadowing-import-from cl-user => else ***)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-61" cond)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-87" case)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-46"
   syntax-rules
   define-syntax
   let-syntax
   letrec-syntax)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-13"
   string string-length string->list string-fill! string?
   string-append string-ref string-set! string-copy list->string
   make-string)
  (:export - * / + < <= = => > >= abs acos and angle append apply asin
  assoc assq assv atan begin boolean? boolean=? bytevector bytevector?
  bytevector-append bytevector-copy bytevector-copy!
  bytevector-length bytevector-u8-ref bytevector-u8-set! caaaar caaadr
  caaar caadar caaddr caadr caar cadaar cadadr cadar caddar cadddr
  caddr cadr call/cc call-with-current-continuation call-with-port
  call-with-values car case case-lambda cdaaar cdaadr cdaar cdadar
  cdaddr cdadr cdar cddaar cddadr cddar cdddar cddddr cdddr cddr cdr
  ceiling char? char<? char<=? char=? char>? char>=? char->integer
  char-alphabetic? char-ci<? char-ci<=? char-ci=? char-ci>? char-ci>=?
  char-downcase char-foldcase char-lower-case? char-numeric?
  char-upcase char-upper-case? char-whitespace? close-input-port
  close-output-port close-port complex? cond cond-expand cons cos
  delay delay-force denominator digit-value do dynamic-wind else
  eof-object eof-object? eq? equal? eqv?  error error-object?
  error-object-irritants error-object-message even? exact exact?
  exact-integer? exact-integer-sqrt exp expt finite? floor floor/
  floor-quotient floor-remainder force for-each gcd
  get-output-bytevector get-output-string guard if imag-part inexact
  inexact? infinite? input-port? integer? integer->char lambda lcm
  length let let* let*-values letrec letrec* let-values list list?
  list->string list->vector list-copy list-ref list-set! list-tail log
  magnitude make-bytevector make-list make-parameter make-polar
  make-promise make-rectangular make-string make-vector map max member
  memq memv min modulo nan? negative? newline not null? number?
  number->string numerator odd? open-input-bytevector
  open-input-string open-output-bytevector open-output-string or
  output-port? pair? parameterize peek-char peek-u8 port? positive?
  procedure? promise? quasiquote quote quotient raise
  raise-continuable rational? rationalize read-bytevector
  read-bytevector! read-char read-error? read-line read-string read-u8
  real? real-part remainder reverse round set! set-car! set-cdr! sin
  sqrt square string string?  string<? string<=? string=? string>?
  string>=? string->list string->number string->symbol string->utf8
  string->vector string-append string-ci<? string-ci<=? string-ci=?
  string-ci>? string-ci>=?  string-copy string-copy! string-downcase
  string-fill! string-foldcase string-for-each string-length
  string-map string-ref string-set!  string-upcase substring symbol?
  symbol=? symbol->string tan textual-port? truncate truncate/
  truncate-quotient truncate-remainder unless unquote unquote-splicing
  utf8->string values vector vector? vector->list vector->string
  vector-append vector-copy vector-copy! vector-fill! vector-for-each
  vector-length vector-map vector-ref vector-set! when
  with-exception-handler write-bytevector write-char write-string
  write-u8 zero?)
  (:export srfi-172-syntax))


(defpackage "https://github.com/g000001/srfi-172#internals"
  (:use cl srfi-23 srfi-45 tg named-readtables babel)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-172"
   srfi-172-syntax)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-23"
   error)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-45#internals"
   box)
  (:shadowing-import-from rnrs define))


;;; *EOF*