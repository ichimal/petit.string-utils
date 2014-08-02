(cl:in-package :petit.sring-utils)

(defgeneric head-match-p (item whole-string))
(defgeneric tail-match-p (item whole-string))
(defgeneric string-%% (item whole-string))
(defgeneric string-## (item whole-string))

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

(defmethod string-%% ((item string) (whole-string string))
  (let ((index (head-match-p item whole-string)))
    (if (integerp index)
      (subseq whole-string index) )))

(defmethod string-%% (obj (whole-string string))
  (string-%% (recursive-coerse-string obj) whole-string) )

(defmethod string-%% ((item string) obj)
  (string-%% item (recursive-coerse-string obj)) )

(defmethod string-## ((item string) (whole-string string))
  (let ((index (tail-match-p item whole-string)))
    (if (integerp index)
      (subseq whole-string 0 index) )))

(defmethod string-## (obj (whole-string string))
  (string-## (recursive-coerse-string obj) whole-string) )

(defmethod string-## ((item string) obj)
  (string-## item (recursive-coerse-string obj)) )

