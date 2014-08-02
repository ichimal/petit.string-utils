(cl:in-package :petit.sring-utils)

(defgeneric head-match-p (item whole-string))
(defgeneric tail-match-p (item whole-string))

(defmethod head-match-p ((item string) (whole-string string))
  (let ((item-length (length item)))
    (if (eql (search item whole-string :end2 item-length) 0)
      item-length )))

(defmethod head-match-p (obj (whole-string string))
  (head-match-p (recursive-coerse-string obj) whole-string) )

(defmethod head-match-p ((item string) obj)
  (head-match-p item (recursive-coerse-string obj)) )

(defmethod tail-match-p ((item string) (whole-string string))
  (let* ((item-length (length item))
         (start2 (- (length whole-string) item-length)) )
    (if (>= start2 0)
      (search item whole-string :start2 start2) )))

(defun string-## (item whole-string)
  (let* ((effective-item
           (if (stringp item)
             item
             (recursive-coerse-string item) ))
         (effective-whole-string
           (if (stringp whole-string)
             whole-string
             (recursive-coerse-string whole-string) ))
         (index (head-match-p effective-item effective-whole-string)) )
    (if (integerp index)
      (values (subseq effective-whole-string index) t)
      (values effective-whole-string nil) )))

(defun string-%% (item whole-string)
  (let* ((effective-item
           (if (stringp item)
             item
             (recursive-coerse-string item) ))
         (effective-whole-string
           (if (stringp whole-string)
             whole-string
             (recursive-coerse-string whole-string) ))
         (index (tail-match-p effective-item effective-whole-string)) )
    (if (integerp index)
      (values (subseq effective-whole-string 0 index) t)
      (values effective-whole-string nil) )))

