(cl:in-package :cl-user)

(defpackage #:petit.string-utils-test-asd
  (:use :cl :asdf) )

(in-package #:petit.string-utils-test-asd)

(defsystem petit.string-utils-test
  :version "0.0.1"
  :author "SUZUKI Shingo"
  :licence "MIT"
  :depends-on (:petit.string-utils :rt)
  :components
    ((:module test
      :serial t
      :components
        (;; setup basic test environment
         (:file :packages)
         ;; test suite
         (:file :builder)
         (:file :filter) ))))

(defmethod perform ((op test-op)
                    (component (eql (find-system :petit.string-utils-test))) )
  (declare (ignore op component))
  (if (funcall (intern "DO-TESTS" :rt))
    (funcall (intern "REM-ALL-TESTS" :rt)) ))

