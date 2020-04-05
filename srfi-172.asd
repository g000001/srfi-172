;;;; srfi-172.asd

(cl:in-package :asdf)


(defsystem :srfi-172
  :version "20200211"
  :description "SRFI 172 for CL: Two Safer Subsets of R7RS"
  :long-description "SRFI 172 for CL: Two Safer Subsets of R7RS
https://srfi.schemers.org/srfi-172"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (rnrs-compat
               flexi-streams
               trivial-garbage
               float-features
               named-readtables
               quasiquote1
               babel
               srfi-0
               srfi-4
               srfi-6
               srfi-11
               srfi-13
               srfi-16
               srfi-23
               srfi-34
               srfi-39
               srfi-45
               srfi-46               
               srfi-61
               srfi-87)
  :components ((:file "package")
               (:file "readtable")
               (:file "srfi-172")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-172))))
  (let ((name "https://github.com/g000001/srfi-172")
        (nickname :srfi-172))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


#|(defmethod perform ((o test-op) (c (eql (find-system :srfi-172))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-172#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-172)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))|#


;;; *EOF*
