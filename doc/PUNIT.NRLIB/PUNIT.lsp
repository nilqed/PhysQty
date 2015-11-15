
(DECLAIM (NOTINLINE |PhysicalUnit;|)) 

(DEFPARAMETER |PhysicalUnit;AL| 'NIL) 

(DEFUN |PhysicalUnit| ()
  (LET (#:G913)
    (COND (|PhysicalUnit;AL|) (T (SETQ |PhysicalUnit;AL| (|PhysicalUnit;|)))))) 

(DEFUN |PhysicalUnit;| ()
  (SPROG ((#1=#:G911 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((* ($ $ $)) T) ((/ ($ $ $)) T)
                       ((^ ($ $ (|Integer|))) T) ((= ((|Boolean|) $ $)) T)
                       ((|%one| ($)) T) ((|coerce| ((|OutputForm|) $)) T))
                     NIL '((|OutputForm|) (|Boolean|) (|Integer|)) NIL))
                   |PhysicalUnit|)
           (SETELT #1# 0 '(|PhysicalUnit|))))) 

(MAKEPROP '|PhysicalUnit| 'NILADIC T) 
