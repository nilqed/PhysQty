
(SDEFUN |PQTY;pqty;2FU$;1|
        ((|v| |Fraction| (|Integer|)) (|e| |Fraction| (|Integer|)) (|u| U)
         ($ $))
        (CONS
         (SPADCALL
          (LIST (SPADCALL |v| |e| (QREFELT $ 9))
                (SPADCALL |v| |e| (QREFELT $ 10)))
          (QREFELT $ 13))
         |u|)) 

(SDEFUN |PQTY;pqtyValue;$F;2| ((|r| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (QCAR |r|) (QREFELT $ 15))) 

(SDEFUN |PQTY;pqtyError;$F;3| ((|r| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 17))
                  (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))) 

(PUT '|PQTY;pqtyUnit;$U;4| '|SPADreplace| 'QCDR) 

(SDEFUN |PQTY;pqtyUnit;$U;4| ((|r| $) ($ U)) (QCDR |r|)) 

(PUT '|PQTY;pqtyInterval;$Ri;5| '|SPADreplace| 'QCAR) 

(SDEFUN |PQTY;pqtyInterval;$Ri;5| ((|r| $) ($ |RationalInterval|)) (QCAR |r|)) 

(SDEFUN |PQTY;*;3$;6| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 24))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 25)))) 

(SDEFUN |PQTY;/;3$;7| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 27))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 28)))) 

(SDEFUN |PQTY;+;3$;8| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 31))
          (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 32)) (QCDR |x|))))) 

(SDEFUN |PQTY;-;3$;9| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 31))
          (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 34)) (QCDR |x|))))) 

(SDEFUN |PQTY;^;$I$;10| ((|x| $) (|n| |Integer|) ($ $))
        (CONS (SPADCALL (QCAR |x|) |n| (QREFELT $ 36))
              (SPADCALL (QCDR |x|) |n| (QREFELT $ 37)))) 

(SDEFUN |PQTY;-;2$;11| ((|x| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QREFELT $ 39)) (QCDR |x|))) 

(SDEFUN |PQTY;pqtyScale;$F$;12| ((|x| $) (|s| |Fraction| (|Integer|)) ($ $))
        (CONS (SPADCALL |s| (QCAR |x|) (QREFELT $ 41)) (QCDR |x|))) 

(SDEFUN |PQTY;elt;F2$;13| ((|q| |Fraction| (|Integer|)) (|x| $) ($ $))
        (SPADCALL |x| |q| (QREFELT $ 42))) 

(PUT '|PQTY;elt;RiU$;14| '|SPADreplace| 'CONS) 

(SDEFUN |PQTY;elt;RiU$;14| ((|qi| |RationalInterval|) (|u| U) ($ $))
        (CONS |qi| |u|)) 

(SDEFUN |PQTY;elt;UU$;15|
        ((|s| |Union| (|Fraction| (|Integer|)) (|Float|) (|DoubleFloat|)
          (|Integer|))
         (|u| U) ($ $))
        (SPROG ((#1=#:G983 NIL))
               (CONS
                (SPADCALL
                 (LIST
                  (PROG2 (LETT #1# |s| . #2=(|PQTY;elt;UU$;15|))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (|Fraction| (|Integer|))
                                    (|Union| (|Fraction| (|Integer|)) (|Float|)
                                             (|DoubleFloat|) (|Integer|))
                                    #1#))
                  (PROG2 (LETT #1# |s| . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (|Fraction| (|Integer|))
                                    (|Union| (|Fraction| (|Integer|)) (|Float|)
                                             (|DoubleFloat|) (|Integer|))
                                    #1#)))
                 (QREFELT $ 13))
                |u|))) 

(SDEFUN |PQTY;coerce;$Of;16| ((|r| $) ($ |OutputForm|))
        (SPADCALL
         (LIST (SPADCALL (QCAR |r|) (QREFELT $ 48)) " "
               (SPADCALL (QCDR |r|) (QREFELT $ 49)))
         (QREFELT $ 51))) 

(DECLAIM (NOTINLINE |PhysQty;|)) 

(DEFUN |PhysQty| (#1=#:G995)
  (SPROG NIL
         (PROG (#2=#:G996)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PhysQty|)
                                               '|domainEqualList|)
                    . #3=(|PhysQty|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PhysQty;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|PhysQty|)))))))))) 

(DEFUN |PhysQty;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PhysQty|))
          (LETT |dv$| (LIST '|PhysQty| DV$1) . #1#)
          (LETT $ (GETREFV 53) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PhysQty| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |ival| (|RationalInterval|))
                              (|:| |unit| |#1|)))
          $))) 

(MAKEPROP '|PhysQty| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Fraction| 18)
              (0 . -) (6 . +) (|List| 8) (|RationalInterval|) (12 . |coerce|)
              |PQTY;pqty;2FU$;1| (17 . |mid|) |PQTY;pqtyValue;$F;2|
              (22 . |len|) (|Integer|) (27 . |coerce|) (32 . /)
              |PQTY;pqtyError;$F;3| |PQTY;pqtyUnit;$U;4|
              |PQTY;pqtyInterval;$Ri;5| (38 . *) (44 . *) |PQTY;*;3$;6|
              (50 . /) (56 . /) |PQTY;/;3$;7| (|Boolean|) (62 . =) (68 . +)
              |PQTY;+;3$;8| (74 . -) |PQTY;-;3$;9| (80 . ^) (86 . ^)
              |PQTY;^;$I$;10| (92 . -) |PQTY;-;2$;11| (97 . |elt|)
              |PQTY;pqtyScale;$F$;12| |PQTY;elt;F2$;13| |PQTY;elt;RiU$;14|
              (|Union| 8 (|Float|) (|DoubleFloat|) 18) |PQTY;elt;UU$;15|
              (|OutputForm|) (103 . |frep|) (108 . |coerce|) (|List| $)
              (113 . |hconcat|) |PQTY;coerce;$Of;16|)
           '#(|pqtyValue| 118 |pqtyUnit| 123 |pqtyScale| 128 |pqtyInterval| 134
              |pqtyError| 139 |pqty| 144 |elt| 151 |coerce| 169 ^ 174 / 180 -
              186 + 197 * 203)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 47))
                             (|makeByteWordVec2| 52
                                                 '(2 8 0 0 0 9 2 8 0 0 0 10 1
                                                   12 0 11 13 1 12 8 0 15 1 12
                                                   8 0 17 1 8 0 18 19 2 8 0 0 0
                                                   20 2 12 0 0 0 24 2 6 0 0 0
                                                   25 2 12 0 0 0 27 2 6 0 0 0
                                                   28 2 6 30 0 0 31 2 12 0 0 0
                                                   32 2 12 0 0 0 34 2 12 0 0 18
                                                   36 2 6 0 0 18 37 1 12 0 0 39
                                                   2 12 0 8 0 41 1 12 47 0 48 1
                                                   6 47 0 49 1 47 0 50 51 1 0 8
                                                   0 16 1 0 6 0 22 2 0 0 0 8 42
                                                   1 0 12 0 23 1 0 8 0 21 3 0 0
                                                   8 8 6 14 2 0 0 12 6 44 2 0 0
                                                   45 6 46 2 0 0 8 0 43 1 0 47
                                                   0 52 2 0 0 0 18 38 2 0 0 0 0
                                                   29 1 0 0 0 40 2 0 0 0 0 35 2
                                                   0 0 0 0 33 2 0 0 0 0 26)))))
           '|lookupComplete|)) 
