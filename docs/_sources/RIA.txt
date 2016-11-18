
RIA - Rational Interval Arithmetics
===================================

The domain **``RationalInterval``** (abbrev. **``RIA``**) implements
*Rational Interval Arithmetics*. We were inspired by the article
`Guaranteed Proofs Using Interval
Arithmetic <https://www.lri.fr/~melquion/doc/05-arith17-article.pdf>`__.
For basic definitions see section 2.1 therein.

Basic Interval Operations
^^^^^^^^^^^^^^^^^^^^^^^^^

::

        "+" : (%,%) -> %
        "-" : (%,%) -> %
        "*" : (%,%) -> %
        "/" : (%,%) -> %
        "^" : (%,I) -> %
        "-" :  % -> %
        abs :  % -> %
        elt : (Q, %) -> %
        coerce: % -> OutputForm
        coerce: List Q -> %
        coerce: Float -> %
        coerce: DF -> %
        
        concise : % -> OutputForm

Constructors and Query Functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

        mki : (Q,Q) -> %
        lb  :  % -> Q
        ub  :  % -> Q
        
        mid :  % -> Q
        len :  % -> Q
        
        frep    : % -> OF
        

These functions and operations are explained in detail below. Note that
``Q`` means the rationals (:math:`\mathbb{Q}`).

.. code:: python

    Q ==> Fraction Integer




.. parsed-literal::

                                                                       Type: Void




In order to use the library we have to load it:

.. code:: python

    )lib RIA


.. parsed-literal::

       RationalInterval is now explicitly exposed in frame initial 
       RationalInterval will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/RIA.NRLIB/RIA
    




.. parsed-literal::

    



Construction of Intervals
~~~~~~~~~~~~~~~~~~~~~~~~~

The first method to construct a rational interval is to use the
constructor function ``mki`` which expects two arguments: the lower
bound ``lb`` and the upper bound ``ub`` returning an object of type
``RationalInterval``.

.. code:: python

    I:=mki(1/2,2/3)


.. parsed-literal::

    Warning: HyperTeX macro table not found




.. parsed-literal::

        1 2
       [-,-]
        2 3
                                                           Type: RationalInterval




Another method is to ``coerce`` a list ``[lb,ub]``, where
:math:`lb \leq ub\in\mathbb{Q}`.

.. code:: python

    I2:=[1/2,2/3]::RIA




.. parsed-literal::

        1 2
       [-,-]
        2 3
                                                           Type: RationalInterval




**Note** that the arguments must be rational numbers, failing which
produces an error:

.. code:: python

    I3:=[0.5,0.6666]::RIA


.. parsed-literal::

     
       Cannot convert the value from type List(Float) to RationalInterval .
    




.. parsed-literal::

    error




However, we can coerce the arguments of course:

.. code:: python

    I3:=[0.5::Q,0.6666::Q]::RIA




.. parsed-literal::

        1 3333
       [-,----]
        2 5000
                                                           Type: RationalInterval




So, as we can see, floating point numbers are converted to rationals.

Query functions
~~~~~~~~~~~~~~~

Objects of type ``RationalInterval`` are not lists, therefore the usual
way to access elements will not work. There are special query functions
expecting an interval as argument.

Lower bound of ``I``
^^^^^^^^^^^^^^^^^^^^

.. code:: python

    lb I




.. parsed-literal::

       1
       -
       2
                                                          Type: Fraction(Integer)




Upper bound of ``I``
^^^^^^^^^^^^^^^^^^^^

.. code:: python

    ub I




.. parsed-literal::

       2
       -
       3
                                                          Type: Fraction(Integer)




Mean value, i.e. :math:`\frac{(lb+ub)}{2}`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    mid I




.. parsed-literal::

        7
       --
       12
                                                          Type: Fraction(Integer)




Length of I, i.e. :math:`ub-lb`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    len I




.. parsed-literal::

       1
       -
       6
                                                          Type: Fraction(Integer)




Floating point representation
'''''''''''''''''''''''''''''

The function ``frep`` gives a floating point representation of the
interval. This function merely is for use with the ``PQTY`` package, so
use with care.

.. code:: python

    frep I




.. parsed-literal::

       0.5833333333_3333333333 ± 0.0833333333_3333333333_3
                                                                 Type: OutputForm




.. code:: python

    digits(8)
    frep I




.. parsed-literal::

       20
                                                            Type: PositiveInteger
       0.58333333 ± 0.083333333
                                                                 Type: OutputForm




Basic Operations
----------------

Intervals can be added, multiplied, scaled and so on. To each operation
an example is given below. For the sake of clarity we use *integer*
rationals:

.. code:: python

    A:=[-1::Q,2]::RIA
    B:=[5::Q,8]::RIA




.. parsed-literal::

       [- 1,2]
                                                           Type: RationalInterval
       [5,8]
                                                           Type: RationalInterval




Addition
''''''''

.. code:: python

    A+B




.. parsed-literal::

       [4,10]
                                                           Type: RationalInterval




Subtraction
'''''''''''

.. code:: python

    A-B




.. parsed-literal::

       [- 9,- 3]
                                                           Type: RationalInterval




Inversion
'''''''''

.. code:: python

    -B




.. parsed-literal::

       [- 8,- 5]
                                                           Type: RationalInterval




.. code:: python

    -- so A+(-B) should equal A-B
    A+(-B)




.. parsed-literal::

       [- 9,- 3]
                                                           Type: RationalInterval




Multiplication
''''''''''''''

.. code:: python

    A*B




.. parsed-literal::

       [- 8,16]
                                                           Type: RationalInterval




Division
''''''''

.. code:: python

    A/B




.. parsed-literal::

          1 2
       [- -,-]
          5 5
                                                           Type: RationalInterval




Exponentiation
''''''''''''''

.. code:: python

    B^2




.. parsed-literal::

       [25,64]
                                                           Type: RationalInterval




.. code:: python

    -- expecting an error
    A^2


.. parsed-literal::

    TYPE-ERROR: 
      #<TYPE-ERROR expected-type: CONS datum: NIL>




.. parsed-literal::

    



.. code:: python

    -- however: A^3
    A^3




.. parsed-literal::

       [- 1,8]
                                                           Type: RationalInterval




.. code:: python

    B^3




.. parsed-literal::

       [125,512]
                                                           Type: RationalInterval




It is obvious that intervals containing ``0`` properly cannot
exponentiated by even integers. Also acting as denominator is usually
**not** possible.

Absolute value (``abs``)
''''''''''''''''''''''''

.. code:: python

    abs A




.. parsed-literal::

       [0,2]
                                                           Type: RationalInterval




.. code:: python

    abs B




.. parsed-literal::

       [5,8]
                                                           Type: RationalInterval




.. code:: python

    abs (A^5)




.. parsed-literal::

       [0,32]
                                                           Type: RationalInterval




Elt
'''

The operation **``elt``** means scaling the inteval by a rational
number:

.. code:: python

    (2/3) A




.. parsed-literal::

          2 4
       [- -,-]
          3 3
                                                           Type: RationalInterval




.. code:: python

    5 B




.. parsed-literal::

       [25,40]
                                                           Type: RationalInterval




.. code:: python

    3 (A+B)




.. parsed-literal::

       [12,30]
                                                           Type: RationalInterval




.. code:: python

    digits(10)
    (12.45666666::Q) A




.. parsed-literal::

       8
                                                            Type: PositiveInteger
          6254156 12508312
       [- -------,--------]
           502073  502073
                                                           Type: RationalInterval




There are ``coercions`` from Float and ``DF`` (DoubleFloat) to type
``RIA`` which are not very useful in this context but are useful in
other packages:

Coercions and pitfalls
^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    -- Attention: Float type depends on precision, digits ...
    1.234567::RIA




.. parsed-literal::

        50737 50737
       [-----,-----]
        41097 41097
                                                           Type: RationalInterval




.. code:: python

    digits(10)
    1.234567::DoubleFloat::RIA




.. parsed-literal::

       10
                                                            Type: PositiveInteger
        118164173 118164173
       [---------,---------]
         95713050  95713050
                                                           Type: RationalInterval




.. code:: python

    digits(20) -- note difference
    1.234567::DoubleFloat::RIA




.. parsed-literal::

       10
                                                            Type: PositiveInteger
        1234567 1234567
       [-------,-------]
        1000000 1000000
                                                           Type: RationalInterval




.. code:: python

    r:DoubleFloat:=%pi/2




.. parsed-literal::

       1.5707963267948966
                                                                Type: DoubleFloat




.. code:: python

    r::RIA




.. parsed-literal::

        80143857 80143857
       [--------,--------]
        51021164 51021164
                                                           Type: RationalInterval




Show RIA
~~~~~~~~

.. code:: python

    )show RIA


.. parsed-literal::

     RationalInterval  is a domain constructor
     Abbreviation for RationalInterval is RIA 
     This constructor is exposed in this frame.
    ------------------------------- Operations --------------------------------
     ?*? : (%,%) -> %                      ?+? : (%,%) -> %
     -? : % -> %                           ?-? : (%,%) -> %
     ?/? : (%,%) -> %                      ?^? : (%,Integer) -> %
     abs : % -> %                          coerce : DecimalExpansion -> %
     coerce : DoubleFloat -> %             coerce : Float -> %
     coerce : % -> OutputForm              concise : % -> OutputForm
     convert : % -> String                 elt : (Fraction(Integer),%) -> %
     frep : % -> OutputForm                lb : % -> Fraction(Integer)
     len : % -> Fraction(Integer)          mid : % -> Fraction(Integer)
     tm_frep : % -> OutputForm             ub : % -> Fraction(Integer)
     coerce : List(Fraction(Integer)) -> %
     mki : (Fraction(Integer),Fraction(Integer)) -> %
    




.. parsed-literal::

    



Decimal Expansions
~~~~~~~~~~~~~~~~~~

While ``Float`` implements arbitrary precision floating point
arithmetic, ``DoubleFloat`` is intended to make accessible hardware
floating point arithmetic, either native double precision, or IEEE.

Many operations are not expected to be fully accurate when using
``DoubleFloat``. In particular, ``sin`` and ``cos`` will lose all
precision for large arguments. The ``Float`` domain provides an
alternative to the ``DoubleFloat`` domain. It provides an arbitrary
precision model of floating point arithmetic. This means that accuracy
problems are eliminated by increasing the working precision where
necessary. ``Float`` provides some special functions such as ``erf``,
the error function in addition to the elementary functions. The
disadvantage of ``Float`` is that it is much more expensive than small
floats when the latter can be used. **Note** that for big numbers
``DoubleFloat`` may overflow!

Another useful ``type`` is ``DecimalExpansion``: allows rational numbers
to be presented as repeating decimal expansions.

.. code:: python

    DE ==> DecimalExpansion




.. parsed-literal::

                                                                       Type: Void




.. code:: python

    1/3::DE




.. parsed-literal::

         _
       0.3
                                                           Type: DecimalExpansion




.. code:: python

    d:=1234567/100000::DE




.. parsed-literal::

       12.34567
                                                           Type: DecimalExpansion




.. code:: python

    d::RIA




.. parsed-literal::

        1234567 1234567
       [-------,-------]
         100000  100000
                                                           Type: RationalInterval




.. code:: python

    d::Float
    d::DoubleFloat




.. parsed-literal::

       12.34567
                                                                      Type: Float
       12.34567
                                                                Type: DoubleFloat




