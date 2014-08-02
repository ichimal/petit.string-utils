;;; string filter
;;; test collection
(cl:in-package :petit.string-utils-test)

;; test for head-match-p
(deftest head-match.1
  (head-match-p "foo" "foobarbaz")
  3 )

(deftest head-match.2
  (head-match-p "foo" "foo")
  3 )

(deftest head-match.3
  (head-match-p "foo" "fo")
  nil )

(deftest head-match.4
  (head-match-p "foo" "barbaz")
  nil )

;; test for tail-match-p
(deftest tail-match.1
  (tail-match-p "baz" "foobarbaz")
  6 )

(deftest tail-match.2
  (tail-match-p "foo" "foo")
  0 )

(deftest tail-match.3
  (tail-match-p "foo" "fo")
  nil )

(deftest tail-match.4
  (tail-match-p "foo" "barbaz")
  nil )

;; tset for string-##
(deftest remove-head.1
  (string-## "foo" "foobarbaz")
  "barbaz" t )

(deftest remove-head.2
  (string-## "foo" "foo")
  "" t )

(deftest remove-head.3
  (string-## "foo" "fo")
  "fo" nil )

(deftest remove-head.4
  (string-## "bar" "foobarbaz")
  "foobarbaz" nil )

;; tset for string-%%
(deftest remove-head.1
  (string-%% "baz" "foobarbaz")
  "foobar" t )

(deftest remove-head.2
  (string-%% "foo" "foo")
  "" t )

(deftest remove-head.3
  (string-%% "foo" "fo")
  "fo" nil )

(deftest remove-head.4
  (string-%% "bar" "foobarbaz")
  "foobarbaz" nil )


