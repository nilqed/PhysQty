
(SDEFUN |SI;mksi;L$;1| ((|l| |List| (|Integer|)) ($ $))
        (SPROG ((|i| NIL) (|r| (|Rep|)))
               (SEQ (LETT |r| (MAKEARR1 7 0) . #1=(|SI;mksi;L$;1|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |r| |i| (SPADCALL |l| |i| (QREFELT $ 9))
                                     (QREFELT $ 10))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |SI;si2l;$L;2| ((|r| $) ($ |List| (|Integer|)))
        (SPROG ((|i| NIL) (|l| (|List| (|Integer|))))
               (SEQ (LETT |l| (LIST 0 0 0 0 0 0 0) . #1=(|SI;si2l;$L;2|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |l| |i| (SPADCALL |r| |i| (QREFELT $ 12))
                                     (QREFELT $ 13))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |SI;*;3$;3| ((|x| $) (|y| $) ($ $))
        (SPROG ((|i| NIL) (|z| (|Rep|)))
               (SEQ (LETT |z| (MAKEARR1 7 0) . #1=(|SI;*;3$;3|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| |i|
                                     (+ (SPADCALL |x| |i| (QREFELT $ 12))
                                        (SPADCALL |y| |i| (QREFELT $ 12)))
                                     (QREFELT $ 10))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |z|)))) 

(SDEFUN |SI;/;3$;4| ((|x| $) (|y| $) ($ $))
        (SPROG ((|i| NIL) (|z| (|Rep|)))
               (SEQ (LETT |z| (MAKEARR1 7 0) . #1=(|SI;/;3$;4|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| |i|
                                     (- (SPADCALL |x| |i| (QREFELT $ 12))
                                        (SPADCALL |y| |i| (QREFELT $ 12)))
                                     (QREFELT $ 10))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |z|)))) 

(SDEFUN |SI;^;$I$;5| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|i| NIL) (|z| (|Rep|)))
               (SEQ (LETT |z| (MAKEARR1 7 0) . #1=(|SI;^;$I$;5|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| |i|
                                     (* (SPADCALL |x| |i| (QREFELT $ 12)) |n|)
                                     (QREFELT $ 10))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |z|)))) 

(SDEFUN |SI;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|res| (|Boolean|)) (|i| NIL))
               (SEQ (LETT |res| 'T . #1=(|SI;=;2$B;6|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (COND
                                  (|res|
                                   (EQL (SPADCALL |x| |i| (QREFELT $ 12))
                                        (SPADCALL |y| |i| (QREFELT $ 12))))
                                  ('T 'NIL))
                                 . #1#)))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SI;coerce;$Of;7| ((|r| $) ($ |OutputForm|))
        (SPROG ((|f| (|OutputForm|)) (|i| NIL) (|sym| (|List| (|String|))))
               (SEQ
                (LETT |sym| (LIST "m" "kg" "s" "A" "K" "mol" "cd")
                      . #1=(|SI;coerce;$Of;7|))
                (LETT |f| (SPADCALL (QREFELT $ 21)) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| 7) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (ZEROP (SPADCALL |r| |i| (QREFELT $ 12))))
                         (LETT |f|
                               (SPADCALL |f|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |sym| |i| (QREFELT $ 24))
                                            (QREFELT $ 26))
                                           (QREFELT $ 27))
                                          (SPADCALL
                                           (SPADCALL |r| |i| (QREFELT $ 12))
                                           (QREFELT $ 28))
                                          (QREFELT $ 29))
                                         (QREFELT $ 30))
                               . #1#)))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |f|)))) 

(SDEFUN |SI;%m;I$;8| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST |n| 0 0 0 0 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;%kg;I$;9| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 |n| 0 0 0 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;%s;I$;10| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 0 |n| 0 0 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;%A;I$;11| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 0 0 |n| 0 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;%K;I$;12| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 0 0 0 |n| 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;%mol;I$;13| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 0 0 0 0 |n| 0) (QREFELT $ 11))) 

(SDEFUN |SI;%cd;I$;14| ((|n| |Integer|) ($ $))
        (SPADCALL (LIST 0 0 0 0 0 0 |n|) (QREFELT $ 11))) 

(SDEFUN |SI;%one;$;15| (($ $)) (SPADCALL (LIST 0 0 0 0 0 0 0) (QREFELT $ 11))) 

(SDEFUN |SI;SIderived;S$;16| ((|s| |String|) ($ $))
        (COND ((EQUAL |s| "hertz") (SPADCALL -1 (QREFELT $ 34)))
              ((EQUAL |s| "newton")
               (SPADCALL
                (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                          (SPADCALL 1 (QREFELT $ 32)) (QREFELT $ 15))
                (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15)))
              ((EQUAL |s| "pascal")
               (SPADCALL
                (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                          (SPADCALL -1 (QREFELT $ 32)) (QREFELT $ 15))
                (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15)))
              ((EQUAL |s| "joule")
               (SPADCALL
                (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                          (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15)))
              ((EQUAL |s| "watt")
               (SPADCALL
                (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                          (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                (SPADCALL -3 (QREFELT $ 34)) (QREFELT $ 15)))
              ((EQUAL |s| "coulomb")
               (SPADCALL (SPADCALL 1 (QREFELT $ 34))
                         (SPADCALL 1 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "volt")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                           (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL -3 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL -1 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "farad")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL -1 (QREFELT $ 33))
                           (SPADCALL -2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL 4 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "ohm")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                           (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL -3 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "siemens")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL -1 (QREFELT $ 33))
                           (SPADCALL -2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL 3 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "weber")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                           (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL -1 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "tesla")
               (SPADCALL
                (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                          (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL -1 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "henry")
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 (QREFELT $ 33))
                           (SPADCALL 2 (QREFELT $ 32)) (QREFELT $ 15))
                 (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15))
                (SPADCALL -2 (QREFELT $ 35)) (QREFELT $ 15)))
              ((EQUAL |s| "lumen") (SPADCALL 1 (QREFELT $ 38)))
              ((EQUAL |s| "lux")
               (SPADCALL (SPADCALL -2 (QREFELT $ 32))
                         (SPADCALL 1 (QREFELT $ 38)) (QREFELT $ 15)))
              ((EQUAL |s| "becquerel") (SPADCALL -1 (QREFELT $ 34)))
              ((OR (EQUAL |s| "gray") (EQUAL |s| "sievert"))
               (SPADCALL (SPADCALL 2 (QREFELT $ 32))
                         (SPADCALL -2 (QREFELT $ 34)) (QREFELT $ 15)))
              ((EQUAL |s| "katal")
               (SPADCALL (SPADCALL -1 (QREFELT $ 34))
                         (SPADCALL 1 (QREFELT $ 37)) (QREFELT $ 15)))
              ('T (|error| "Expected string name of a derived SI unit.")))) 

(SDEFUN |SI;mkxpr|
        ((|s| |List| (|Symbol|)) (|v| |Vector| (|Integer|))
         ($ |Expression| (|Integer|)))
        (SPROG ((|r| (|Expression| (|Integer|))) (#1=#:G952 NIL) (|j| NIL))
               (SEQ (LETT |r| (|spadConstant| $ 42) . #2=(|SI;mkxpr|))
                    (SEQ (LETT |j| 1 . #2#) (LETT #1# (LENGTH |s|) . #2#) G190
                         (COND ((|greater_SI| |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |r|
                                 (SPADCALL |r|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |s| |j| (QREFELT $ 44))
                                             (QREFELT $ 45))
                                            (SPADCALL |v| |j| (QREFELT $ 47))
                                            (QREFELT $ 48))
                                           (QREFELT $ 49))
                                 . #2#)))
                         (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |SI;buck;TL;18|
        ((|t| |Table| (|Symbol|) $) ($ |List| (|Expression| (|Integer|))))
        (SPROG
         ((|r| (|List| (|Expression| (|Integer|)))) (#1=#:G959 NIL) (|j| NIL)
          (|ns| (|List| (|Vector| (|Integer|)))) (M (|Matrix| (|Integer|)))
          (#2=#:G958 NIL) (|x| NIL) (#3=#:G957 NIL))
         (SEQ
          (LETT M
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|SI;buck;TL;18|))
                  (SEQ (LETT |x| NIL . #4#)
                       (LETT #2# (SPADCALL |t| (QREFELT $ 51)) . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SPADCALL (SPADCALL |t| |x| (QREFELT $ 52))
                                          (QREFELT $ 14))
                                #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 55))
                . #4#)
          (LETT |ns| (SPADCALL (SPADCALL M (QREFELT $ 56)) (QREFELT $ 58))
                . #4#)
          (LETT |r| NIL . #4#)
          (SEQ (LETT |j| 1 . #4#) (LETT #1# (LENGTH |ns|) . #4#) G190
               (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |r|
                       (APPEND |r|
                               (LIST
                                (|SI;mkxpr| (SPADCALL |t| (QREFELT $ 51))
                                 (SPADCALL |ns| |j| (QREFELT $ 59)) $)))
                       . #4#)))
               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |SIunit;|)) 

(DEFUN |SIunit| ()
  (SPROG NIL
         (PROG (#1=#:G961)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SIunit|) . #2=(|SIunit|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SIunit|
                             (LIST (CONS NIL (CONS 1 (|SIunit;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|SIunit|)))))))))) 

(DEFUN |SIunit;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SIunit|) . #1=(|SIunit|))
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SIunit| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|OneDimensionalArray| (|Integer|)))
          $))) 

(MAKEPROP '|SIunit| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|List| 7) (0 . |elt|)
              (6 . |setelt!|) |SI;mksi;L$;1| (13 . |elt|) (19 . |setelt!|)
              |SI;si2l;$L;2| |SI;*;3$;3| |SI;/;3$;4| |SI;^;$I$;5| (|Boolean|)
              |SI;=;2$B;6| (|OutputForm|) (26 . |empty|) (|String|) (|List| 22)
              (30 . |elt|) (|Symbol|) (36 . |coerce|) (41 . |coerce|)
              (46 . |coerce|) (51 . ^) (57 . |hconcat|) |SI;coerce;$Of;7|
              |SI;%m;I$;8| |SI;%kg;I$;9| |SI;%s;I$;10| |SI;%A;I$;11|
              |SI;%K;I$;12| |SI;%mol;I$;13| |SI;%cd;I$;14| |SI;%one;$;15|
              |SI;SIderived;S$;16| (|Expression| 7) (63 . |One|) (|List| 25)
              (67 . |elt|) (73 . |coerce|) (|Vector| 7) (78 . |elt|) (84 . ^)
              (90 . *) (|Table| 25 $$) (96 . |keys|) (101 . |elt|) (|List| 8)
              (|Matrix| 7) (107 . |matrix|) (112 . |transpose|) (|List| 46)
              (117 . |nullSpace|) (122 . |elt|) (|List| 41) (|Table| 25 $)
              |SI;buck;TL;18|)
           '#(|si2l| 128 |mksi| 133 |coerce| 138 |buck| 143 ^ 148 |SIderived|
              154 = 159 / 165 * 171 |%s| 177 |%one| 182 |%mol| 186 |%m| 191
              |%kg| 196 |%cd| 201 %K 206 %A 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS '#((|PhysicalUnit|) (|CoercibleTo| 20))
                             (|makeByteWordVec2| 62
                                                 '(2 8 7 0 7 9 3 6 7 0 7 7 10 2
                                                   6 7 0 7 12 3 8 7 0 7 7 13 0
                                                   20 0 21 2 23 22 0 7 24 1 25
                                                   0 22 26 1 25 20 0 27 1 7 20
                                                   0 28 2 20 0 0 0 29 2 20 0 0
                                                   0 30 0 41 0 42 2 43 25 0 7
                                                   44 1 41 0 25 45 2 46 7 0 7
                                                   47 2 41 0 0 7 48 2 41 0 0 0
                                                   49 1 50 43 0 51 2 50 2 0 25
                                                   52 1 54 0 53 55 1 54 0 0 56
                                                   1 54 57 0 58 2 57 46 0 7 59
                                                   1 0 8 0 14 1 0 0 8 11 1 0 20
                                                   0 31 1 0 60 61 62 2 0 0 0 7
                                                   17 1 0 0 22 40 2 0 18 0 0 19
                                                   2 0 0 0 0 16 2 0 0 0 0 15 1
                                                   0 0 7 34 0 0 0 39 1 0 0 7 37
                                                   1 0 0 7 32 1 0 0 7 33 1 0 0
                                                   7 38 1 0 0 7 36 1 0 0 7
                                                   35)))))
           '|lookupComplete|)) 

(MAKEPROP '|SIunit| 'NILADIC T) 
