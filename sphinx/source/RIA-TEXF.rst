
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

    )set output tex on
    Q ==> Fraction Integer




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Void}\)




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




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {1 \over 2}, \: {2 \over 3} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Another method is to ``coerce`` a list ``[lb,ub]``, where
:math:`lb \leq ub\in\mathbb{Q}`.

.. code:: python

    I2:=[1/2,2/3]::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {1 \over 2}, \: {2 \over 3} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




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




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {1 \over 2}, \: {{3333} \over {5000}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




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




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    1 \over 2 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Fraction(Integer)}\)




Upper bound of ``I``
^^^^^^^^^^^^^^^^^^^^

.. code:: python

    ub I




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    2 \over 3 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Fraction(Integer)}\)




Mean value, i.e. :math:`\frac{(lb+ub)}{2}`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    mid I




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    7 \over {12} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Fraction(Integer)}\)




Length of I, i.e. :math:`ub-lb`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    len I




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    1 \over 6 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Fraction(Integer)}\)




Floating point representation
'''''''''''''''''''''''''''''

The function ``frep`` gives a floating point representation of the
interval. This function merely is for use with the ``PQTY`` package, so
use with care.

.. code:: python

    frep I




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {0.5833333333\_3333333333}{\ }±{\ }{0.0833333333\_3333333333\_3} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{OutputForm}\)




.. code:: python

    digits(8)
    frep I




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    20 
    \leqno(NIL)
    $$
    
    $$
    {0.58333333}{\ }±{\ }{0.083333333} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{OutputForm}\)




Basic Operations
----------------

Intervals can be added, multiplied, scaled and so on. To each operation
an example is given below. For the sake of clarity we use *integer*
rationals:

.. code:: python

    A:=[-1::Q,2]::RIA
    B:=[5::Q,8]::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -1, \: 2 
    \right]
    \leqno(NIL)
    $$
    
    $$
    \left[
    5, \: 8 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Addition
''''''''

.. code:: python

    A+B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    4, \: {10} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Subtraction
'''''''''''

.. code:: python

    A-B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -9, \: -3 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Inversion
'''''''''

.. code:: python

    -B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -8, \: -5 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    -- so A+(-B) should equal A-B
    A+(-B)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -9, \: -3 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Multiplication
''''''''''''''

.. code:: python

    A*B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -8, \: {16} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Division
''''''''

.. code:: python

    A/B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -{1 \over 5}, \: {2 \over 5} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Exponentiation
''''''''''''''

.. code:: python

    B^2




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {25}, \: {64} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




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




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -1, \: 8 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    B^3




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {125}, \: {512} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




It is obvious that intervals containing ``0`` properly cannot
exponentiated by even integers. Also acting as denominator is usually
**not** possible.

Absolute value (``abs``)
''''''''''''''''''''''''

.. code:: python

    abs A




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    0, \: 2 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    abs B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    5, \: 8 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    abs (A^5)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    0, \: {32} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




Elt
'''

The operation **``elt``** means scaling the inteval by a rational
number:

.. code:: python

    (2/3) A




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    -{2 \over 3}, \: {4 \over 3} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    5 B




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {25}, \: {40} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    3 (A+B)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {12}, \: {30} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    digits(10)
    (12.45666666::Q) A




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    8 
    \leqno(NIL)
    $$
    
    $$
    \left[
    -{{6254156} \over {502073}}, \: {{12508312} \over {502073}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




There are ``coercions`` from Float and ``DF`` (DoubleFloat) to type
``RIA`` which are not very useful in this context but are useful in
other packages:

Coercions and pitfalls
^^^^^^^^^^^^^^^^^^^^^^

.. code:: python

    -- Attention: Float type depends on precision, digits ...
    1.234567::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {{50737} \over {41097}}, \: {{50737} \over {41097}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    digits(10)
    1.234567::DoubleFloat::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    10 
    \leqno(NIL)
    $$
    
    $$
    \left[
    {{118164173} \over {95713050}}, \: {{118164173} \over {95713050}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    digits(20) -- note difference
    1.234567::DoubleFloat::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    10 
    \leqno(NIL)
    $$
    
    $$
    \left[
    {{1234567} \over {1000000}}, \: {{1234567} \over {1000000}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    r:DoubleFloat:=%pi/2




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    1.5707963267948966 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{DoubleFloat}\)




.. code:: python

    r::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {{80143857} \over {51021164}}, \: {{80143857} \over {51021164}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




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




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Void}\)




.. code:: python

    1/3::DE




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    0.{\overline 3} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{DecimalExpansion}\)




.. code:: python

    d:=1234567/100000::DE




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {12}.{34567} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{DecimalExpansion}\)




.. code:: python

    d::RIA




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \left[
    {{1234567} \over {100000}}, \: {{1234567} \over {100000}} 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{RationalInterval}\)




.. code:: python

    d::Float
    d::DoubleFloat




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    12.34567 
    \leqno(NIL)
    $$
    
    $$
    12.34567 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{DoubleFloat}\)




