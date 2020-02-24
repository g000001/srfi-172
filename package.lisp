;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-172"
  (:use
   "https://github.com/g000001/srfi-0"
   "https://github.com/g000001/srfi-6"
   "https://github.com/g000001/srfi-11"
   "https://github.com/g000001/srfi-13"
   "https://github.com/g000001/srfi-16"
   "https://github.com/g000001/srfi-23"
   "https://github.com/g000001/srfi-34"
   "https://github.com/g000001/srfi-39"
   "https://github.com/g000001/srfi-45"
   quasiquote1
   rnrs)
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


(defpackage "https://github.com/g000001/srfi-172#functional"
  (:use "https://github.com/g000001/srfi-172")
  (:export srfi-172-syntax)
  (:export
   cond-expand asin char->integer char-whitespace?  square
   eof-object char-ci>?  list->vector char<=?  char>=?  error-object?
   truncate/ string->symbol quasiquote char-alphabetic?  truncate
   rational?  not log do cos memq integer?  make-vector eqv?  finite?
   cond truncate-remainder string-map or string-copy char-ci<=?
   append procedure?  string=?  bytevector-u8-ref positive?  for-each
   list-copy string>=?  denominator symbol?  unquote-splicing cdaddr
   cdadar caaddr caadar with-exception-handler char-ci=?  if list-ref
   and list-tail vector->string unquote list->string utf8->string
   make-string parameterize open-input-string digit-value string?
   open-input-bytevector => equal?  bytevector-length eof-object?
   exact?  char=?  char<?  ceiling char-ci>=?  bytevector?
   error-object-message floor-remainder let bytevector-append >= <=
   open-output-bytevector modulo floor/ rationalize cdadr
   char-foldcase caaar string-ci=?  bytevector
   call-with-current-continuation open-output-string memv cdar real?
   cdaadr cdaaar caar cddadr cddaar caaadr integer->char caaaar
   newline cadadr let-values string<?  exact-integer-sqrt
   char-upper-case?  apply make-promise cdr floor-quotient string<=?
   vector-ref get-output-string infinite?  string-length string->list
   cddar raise-continuable negative?  char-downcase cadar
   char-numeric?  call-with-values string error-object-irritants
   string->utf8 lambda lcm inexact?  gcd magnitude string-append
   make-rectangular cadr cdddr let*-values case-lambda caddr guard
   make-parameter string-ci<?  char>?  assoc expt error let* cddr atan
   assv exact null?  even?  sqrt imag-part real-part vector char?
   cons char-ci<?  delay cdaar begin else caadr raise list when abs
   substring force round angle pair?  floor symbol->string odd?  zero?
   make-polar vector-copy nan?  vector-map vector-for-each quotient
   map vector-length boolean=?  boolean?  get-output-bytevector
   letrec* char-upcase exact-integer?  quote max vector->list
   string->vector complex?  reverse remainder letrec tan sin values
   promise?  min eq?  car assq symbol=?  inexact delay-force call/cc
   unless make-bytevector length string->number vector-append list?
   char-lower-case?  numerator truncate-quotient number?  string-ref
   string-ci>?  make-list string-foldcase number->string
   bytevector-copy acos string-upcase case cadaar member cddddr
   vector?  cdddar string>?  cadddr caddar exp > = < + / - *
   string-for-each string-ci<=?  string-downcase string-ci>=?
   dynamic-wind))


(defpackage "https://github.com/g000001/srfi-172#internals"
  (:use "https://github.com/g000001/srfi-4"
        "https://github.com/g000001/srfi-23"
        "https://github.com/g000001/srfi-45"
        cl
        tg
        named-readtables
        babel)
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
