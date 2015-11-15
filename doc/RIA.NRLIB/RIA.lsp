
(SDEFUN |RIA;mki;2F$;1|
        ((|a| |Fraction| (|Integer|)) (|b| |Fraction| (|Integer|)) ($ $))
        (COND ((SPADCALL |b| |a| (QREFELT $ 9)) (CONS |a| |b|)))) 

(PUT '|RIA;lb;$F;2| '|SPADreplace| 'QCAR) 

(SDEFUN |RIA;lb;$F;2| ((|r| $) ($ |Fraction| (|Integer|))) (QCAR |r|)) 

(PUT '|RIA;ub;$F;3| '|SPADreplace| 'QCDR) 

(SDEFUN |RIA;ub;$F;3| ((|r| $) ($ |Fraction| (|Integer|))) (QCDR |r|)) 

(SDEFUN |RIA;+;3$;4| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 13))
                  (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 13))
                  (QREFELT $ 10))) 

(SDEFUN |RIA;-;3$;5| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |x|) (QCDR |y|) (QREFELT $ 15))
                  (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 15))
                  (QREFELT $ 10))) 

(SDEFUN |RIA;*;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG ((|b| (|Fraction| (|Integer|))) (|a| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |a|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 17))
                        (SPADCALL (QCAR |x|) (QCDR |y|) (QREFELT $ 17))
                        (QREFELT $ 18))
                       (SPADCALL
                        (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 17))
                        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 17))
                        (QREFELT $ 18))
                       (QREFELT $ 18))
                      . #1=(|RIA;*;3$;6|))
                (LETT |b|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 17))
                        (SPADCALL (QCAR |x|) (QCDR |y|) (QREFELT $ 17))
                        (QREFELT $ 19))
                       (SPADCALL
                        (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 17))
                        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 17))
                        (QREFELT $ 19))
                       (QREFELT $ 19))
                      . #1#)
                (EXIT (SPADCALL |a| |b| (QREFELT $ 10)))))) 

(SDEFUN |RIA;/;3$;7| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL (SPADCALL (QCAR |y|) (QCDR |y|) (QREFELT $ 17))
                    (|spadConstant| $ 21) (QREFELT $ 22))
          (SPADCALL |x|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 23) (QCDR |y|) (QREFELT $ 24))
                     (SPADCALL (|spadConstant| $ 23) (QCAR |y|) (QREFELT $ 24))
                     (QREFELT $ 10))
                    (QREFELT $ 20))))) 

(SDEFUN |RIA;-;2$;8| ((|x| $) ($ $))
        (SPADCALL (SPADCALL (QCDR |x|) (QREFELT $ 26))
                  (SPADCALL (QCAR |x|) (QREFELT $ 26)) (QREFELT $ 10))) 

(SDEFUN |RIA;abs;2$;9| ((|x| $) ($ $))
        (COND
         ((SPADCALL (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 17))
                    (|spadConstant| $ 21) (QREFELT $ 9))
          (SPADCALL
           (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 28))
                     (SPADCALL (QCDR |x|) (QREFELT $ 28)) (QREFELT $ 18))
           (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 28))
                     (SPADCALL (QCDR |x|) (QREFELT $ 28)) (QREFELT $ 19))
           (QREFELT $ 10)))
         ('T
          (SPADCALL (|spadConstant| $ 21)
                    (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 28))
                              (SPADCALL (QCDR |x|) (QREFELT $ 28))
                              (QREFELT $ 19))
                    (QREFELT $ 10))))) 

(SDEFUN |RIA;^;$I$;10| ((|x| $) (|n| |Integer|) ($ $))
        (COND
         ((ZEROP |n|)
          (SPADCALL (|spadConstant| $ 23) (|spadConstant| $ 23)
                    (QREFELT $ 10)))
         ((EQL |n| 1) |x|)
         ((OR (SPADCALL (QCAR |x|) (|spadConstant| $ 21) (QREFELT $ 9))
              (ODDP |n|))
          (SPADCALL (SPADCALL (QCAR |x|) |n| (QREFELT $ 31))
                    (SPADCALL (QCDR |x|) |n| (QREFELT $ 31)) (QREFELT $ 10)))
         ((OR (SPADCALL (QCDR |x|) (|spadConstant| $ 21) (QREFELT $ 32))
              (SPADCALL |n| (QREFELT $ 33)))
          (SPADCALL (SPADCALL (QCDR |x|) |n| (QREFELT $ 31))
                    (SPADCALL (QCAR |x|) |n| (QREFELT $ 31)) (QREFELT $ 10)))
         ('T
          (SPADCALL (|spadConstant| $ 21)
                    (SPADCALL (SPADCALL (QCAR |x|) |n| (QREFELT $ 31))
                              (SPADCALL (QCDR |x|) |n| (QREFELT $ 31))
                              (QREFELT $ 19))
                    (QREFELT $ 10))))) 

(SDEFUN |RIA;coerce;$Of;11| ((|r| $) ($ |OutputForm|))
        (SPADCALL
         (LIST (SPADCALL (QCAR |r|) (QREFELT $ 36))
               (SPADCALL (QCDR |r|) (QREFELT $ 36)))
         (QREFELT $ 38))) 

(SDEFUN |RIA;coerce;L$;12| ((|l| |List| (|Fraction| (|Integer|))) ($ $))
        (COND
         ((SPADCALL (LENGTH |l|) 2 (QREFELT $ 41)) (|error| "Format: [lb,ub]"))
         ((SPADCALL (SPADCALL |l| 1 (QREFELT $ 43))
                    (SPADCALL |l| 2 (QREFELT $ 43)) (QREFELT $ 22))
          (|error| "Must have lb <= ub"))
         ('T
          (SPADCALL (SPADCALL |l| 1 (QREFELT $ 43))
                    (SPADCALL |l| 2 (QREFELT $ 43)) (QREFELT $ 10))))) 

(SDEFUN |RIA;coerce;Df$;13| ((|r| |DoubleFloat|) ($ $))
        (SPROG ((|rc| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |rc| (SPADCALL |r| (QREFELT $ 46)) |RIA;coerce;Df$;13|)
                (EXIT (SPADCALL |rc| |rc| (QREFELT $ 10)))))) 

(SDEFUN |RIA;coerce;F$;14| ((|r| |Float|) ($ $))
        (SPROG ((|rc| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |rc| (SPADCALL |r| (QREFELT $ 49)) |RIA;coerce;F$;14|)
                (EXIT (SPADCALL |rc| |rc| (QREFELT $ 10)))))) 

(SDEFUN |RIA;coerce;De$;15| ((|r| |DecimalExpansion|) ($ $))
        (SPROG ((|rc| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |rc| (SPADCALL |r| (QREFELT $ 52)) |RIA;coerce;De$;15|)
                (EXIT (SPADCALL |rc| |rc| (QREFELT $ 10)))))) 

(SDEFUN |RIA;coerceSTR| ((|s| |String|) ($ $))
        (SPROG
         ((|v| (|DoubleFloat|)) (|vs| (|String|)) (|s2| #1=(|List| (|String|)))
          (|s1| #1#))
         (SEQ
          (LETT |s1| (SPADCALL |s| (|STR_to_CHAR| ".") (QREFELT $ 56))
                . #2=(|RIA;coerceSTR|))
          (LETT |s2|
                (SPADCALL (SPADCALL |s1| 2 (QREFELT $ 58)) (|STR_to_CHAR| "(")
                          (QREFELT $ 56))
                . #2#)
          (LETT |vs|
                (SPADCALL
                 (LIST (SPADCALL |s1| 1 (QREFELT $ 58)) "."
                       (SPADCALL |s2| 1 (QREFELT $ 58)))
                 (QREFELT $ 59))
                . #2#)
          (LETT |v| (SPADCALL |vs| (QREFELT $ 61)) . #2#)
          (EXIT (SPADCALL |v| (QREFELT $ 47)))))) 

(SDEFUN |RIA;elt;F2$;17| ((|q| |Fraction| (|Integer|)) (|x| $) ($ $))
        (SPADCALL (SPADCALL |q| (QCAR |x|) (QREFELT $ 17))
                  (SPADCALL |q| (QCDR |x|) (QREFELT $ 17)) (QREFELT $ 10))) 

(SDEFUN |RIA;mid;$F;18| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 13))
                  (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 24))) 

(SDEFUN |RIA;len;$F;19| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (QCDR |x|) (QCAR |x|) (QREFELT $ 15))) 

(SDEFUN |RIA;frep;$Of;20| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|sep| (|Symbol|)) (|blk| (|Symbol|)) (|sp| #1=(|Character|))
          (|pm| #1#))
         (SEQ
          (LETT |pm| (SPADCALL 177 (QREFELT $ 66)) . #2=(|RIA;frep;$Of;20|))
          (LETT |sp| (SPADCALL 32 (QREFELT $ 66)) . #2#)
          (LETT |blk| (SPADCALL (SPADCALL |sp| (QREFELT $ 67)) (QREFELT $ 69))
                . #2#)
          (LETT |sep| (SPADCALL (SPADCALL |pm| (QREFELT $ 67)) (QREFELT $ 69))
                . #2#)
          (EXIT
           (SPADCALL
            (LIST
             (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (QREFELT $ 70))
                       (QREFELT $ 71))
             (SPADCALL |blk| (QREFELT $ 72)) (SPADCALL |sep| (QREFELT $ 72))
             (SPADCALL |blk| (QREFELT $ 72))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT $ 65))
                         (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 24))
               (QREFELT $ 70))
              (QREFELT $ 71)))
            (QREFELT $ 73)))))) 

(SDEFUN |RIA;tm_frep;$Of;21| ((|x| $) ($ |OutputForm|))
        (SPROG ((|sep| (|Symbol|)))
               (SEQ (LETT |sep| '| <pm> | |RIA;tm_frep;$Of;21|)
                    (EXIT
                     (SPADCALL
                      (LIST
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (QREFELT $ 75))
                        (QREFELT $ 76))
                       (SPADCALL |sep| (QREFELT $ 72))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 65))
                                   (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 24))
                         (QREFELT $ 75))
                        (QREFELT $ 76)))
                      (QREFELT $ 73)))))) 

(SDEFUN |RIA;concise;$Of;22| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 74))) 

(DECLAIM (NOTINLINE |RationalInterval;|)) 

(DEFUN |RationalInterval| ()
  (SPROG NIL
         (PROG (#1=#:G910)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RationalInterval|)
                    . #2=(|RationalInterval|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RationalInterval|
                             (LIST (CONS NIL (CONS 1 (|RationalInterval;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RationalInterval|)))))))))) 

(DEFUN |RationalInterval;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RationalInterval|) . #1=(|RationalInterval|))
          (LETT $ (GETREFV 79) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalInterval| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |lb| (|Fraction| (|Integer|)))
                              (|:| |ub| (|Fraction| (|Integer|)))))
          $))) 

(MAKEPROP '|RationalInterval| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|Fraction| 30)
              (0 . >=) |RIA;mki;2F$;1| |RIA;lb;$F;2| |RIA;ub;$F;3| (6 . +)
              |RIA;+;3$;4| (12 . -) |RIA;-;3$;5| (18 . *) (24 . |min|)
              (30 . |max|) |RIA;*;3$;6| (36 . |Zero|) (40 . >) (46 . |One|)
              (50 . /) |RIA;/;3$;7| (56 . -) |RIA;-;2$;8| (61 . |abs|)
              |RIA;abs;2$;9| (|Integer|) (66 . ^) (72 . <=) (78 . |even?|)
              |RIA;^;$I$;10| (|OutputForm|) (83 . |coerce|) (|List| $)
              (88 . |bracket|) |RIA;coerce;$Of;11| (|NonNegativeInteger|)
              (93 . ~=) (|List| 8) (99 . |elt|) |RIA;coerce;L$;12|
              (|DoubleFloat|) (105 . |retract|) |RIA;coerce;Df$;13| (|Float|)
              (110 . |retract|) |RIA;coerce;F$;14| (|DecimalExpansion|)
              (115 . |retract|) |RIA;coerce;De$;15| (|Character|) (|String|)
              (120 . |split|) (|List| 55) (126 . |elt|) (132 . |concat|)
              (|InputForm|) (137 . |float|) |RIA;elt;F2$;17| (142 . |coerce|)
              |RIA;mid;$F;18| |RIA;len;$F;19| (147 . |char|) (152 . |coerce|)
              (|Symbol|) (157 . |coerce|) (162 . |coerce|) (167 . |coerce|)
              (172 . |coerce|) (177 . |hconcat|) |RIA;frep;$Of;20|
              (182 . |coerce|) (187 . |coerce|) |RIA;tm_frep;$Of;21|
              |RIA;concise;$Of;22|)
           '#(|ub| 192 |tm_frep| 197 |mki| 202 |mid| 208 |len| 213 |lb| 218
              |frep| 223 |elt| 228 |convert| 234 |concise| 239 |coerce| 244
              |abs| 269 ^ 274 / 280 - 286 + 297 * 303)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS '#((|CoercibleTo| 35) (|ConvertibleTo| 55))
                             (|makeByteWordVec2| 78
                                                 '(2 8 7 0 0 9 2 8 0 0 0 13 2 8
                                                   0 0 0 15 2 8 0 0 0 17 2 8 0
                                                   0 0 18 2 8 0 0 0 19 0 8 0 21
                                                   2 8 7 0 0 22 0 8 0 23 2 8 0
                                                   0 0 24 1 8 0 0 26 1 8 0 0 28
                                                   2 8 0 0 30 31 2 8 7 0 0 32 1
                                                   30 7 0 33 1 8 35 0 36 1 35 0
                                                   37 38 2 40 7 0 0 41 2 42 8 0
                                                   30 43 1 45 8 0 46 1 48 8 0
                                                   49 1 51 8 0 52 2 55 37 0 54
                                                   56 2 57 55 0 30 58 1 55 0 37
                                                   59 1 60 45 0 61 1 8 0 30 63
                                                   1 54 0 30 66 1 55 0 54 67 1
                                                   68 0 55 69 1 48 0 8 70 1 48
                                                   35 0 71 1 68 35 0 72 1 35 0
                                                   37 73 1 45 0 8 75 1 45 35 0
                                                   76 1 0 8 0 12 1 0 35 0 77 2
                                                   0 0 8 8 10 1 0 8 0 64 1 0 8
                                                   0 65 1 0 8 0 11 1 0 35 0 74
                                                   2 0 0 8 0 62 1 0 55 0 1 1 0
                                                   35 0 78 1 0 0 51 53 1 0 0 48
                                                   50 1 0 0 45 47 1 0 0 42 44 1
                                                   0 35 0 39 1 0 0 0 29 2 0 0 0
                                                   30 34 2 0 0 0 0 25 1 0 0 0
                                                   27 2 0 0 0 0 16 2 0 0 0 0 14
                                                   2 0 0 0 0 20)))))
           '|lookupComplete|)) 

(MAKEPROP '|RationalInterval| 'NILADIC T) 
