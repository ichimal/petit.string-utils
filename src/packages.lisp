(cl:in-package #:petit.string-utils-asd)

(defpackage :petit.sring-utils
  (:use :cl)
  (:nicknames :petit.strutils :petit.su :psu)
  (:export
    ;; for builder
    #:coerce-string
    #:string-++ #:string-++2
    ;; for filter
    #:string-%% #:string-##
    #:head-match-p #:tail-match-p ))

