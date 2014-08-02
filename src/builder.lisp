(cl:in-package :petit.sring-utils)

(defgeneric coerce-string (obj))

(defun recursive-coerse-string (obj)
  (typecase obj
    (string obj)
    (character (string obj))
    ((or list vector) (reduce #'string-++2 obj))
    (otherwise (coerce-string obj)) ))

(defun string-++2 (pre post)
  (let ((effective-pre (recursive-coerse-string pre))
        (effective-post (recursive-coerse-string post)) )
    (check-type effective-pre string)
    (check-type effective-post string)
    (concatenate 'string effective-pre effective-post) ))

(defun string-++ (&rest objs)
  (cond ((null objs) "")
        ((null (cdr objs))
         (typecase (car objs)
           (list (apply #'string-++ (car objs)))
           (vector (reduce #'string-++2 (car objs)))
           (otherwise (coerce-string (car objs))) ))
        (t (reduce #'string-++2 objs)) ))

(defmethod coerce-string (obj)
  (etypecase obj
    (string obj)
    (character (string obj))
    (symbol (symbol-name obj))
    (number (format nil "~s" obj)) ))

