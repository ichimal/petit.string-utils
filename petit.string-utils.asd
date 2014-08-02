(cl:in-package :cl-user)

(defpackage #:petit.string-utils-asd
  (:use :cl :asdf) )

(in-package #:petit.string-utils-asd)

(defsystem petit.string-utils
  :name "petit string utilities"
  :version "0.0.1"
  :maintainer "SUZUKI Shingo"
  :author "SUZUKI Shingo"
  :licence "MIT"
  :description "petit string utilities"
  :components
    ((:module :src
      :serial t
      :components ((:file :packages)
                   (:file :builder) ))))

