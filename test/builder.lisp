;;; string builder
;;; test collection
(cl:in-package :petit.string-utils-test)

;; for coerce-string
(deftest coerce.string.1
  (coerce-string "foo")
  "foo" )

(deftest coerce.char.1
  (coerce-string #\a)
  "a" )

(deftest coerce.symbol.1
  (coerce-string '%$#)
  "%$#" )

(deftest coerce.number.1
  (coerce-string 1)
  "1" )

(deftest coerce.number.2
  (string= (coerce-string pi) (format nil "~s" pi))
  t )

(deftest coerce.list.1
  (handler-case (coerce-string (list 1 2))
    (type-error () t) )
  t )

(deftest coerce.vector.1
  (handler-case (coerce-string #(3 4))
    (type-error () t) )
  t )

;; for string-++
(deftest build.nullary.1
  (string-++)
  "" )

(deftest build.unary.string.1
  (string-++ "abcdefg")
  "abcdefg" )

(deftest build.unary.char.1
  (string-++ #\a)
  "a" )

(deftest build.unary.number.1
  (string-++ 1)
  "1" )

(deftest build.unary.number.2
  (string= (string-++ pi) (format nil "~s" pi))
  t )

(deftest build.unary.symbol.1
  (string= (string-++ 'pi) (symbol-name 'pi))
  t )

(deftest build.binary.string-string.1
  (string-++ "abc" "def")
  "abcdef" )

(deftest build.binary.char-string.1
  (string-++ #\a "bcd")
  "abcd" )

(deftest build.binary.string-char.1
  (string-++ "abc" #\d)
  "abcd" )

(deftest build.binary.char-char.1
  (string-++ #\a #\b)
  "ab" )

(deftest build.binary.number-string.1
  (string-++ 1 "234")
  "1234" )

(deftest build.binary.string-number.1
  (string-++ "123" 4)
  "1234" )

(deftest build.binary.number-number.1
  (string-++ 1 2)
  "12" )

(deftest build.list.1
  (string-++ (list 1 2 3 4))
  "1234" )

(deftest build.list.2
  (string-++ (list 1 2 (list 3 4)))
  "1234" )

(deftest build.vector.1
  (string-++ #(1 2 3 4))
  "1234" )

(deftest build.vector.2
  (string-++ #(1 2 #(3 4))) 
  "1234" )

(deftest build.hetero.1
  (string-++ #\a "Bc" :d)
  "aBcD" )

(deftest build.hetero.2
  (string= (string-++ "pi" #\space '= #\space pi)
           (format nil "pi = ~s" pi) )
  t )

(deftest build.hetero.3
  (string-++ 1 2 '(3 4 #(5 6 (7 8) 9 10) 11 12))
  "123456789101112" )


