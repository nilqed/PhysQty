
PQTY - Physical Quantities
==========================

    A physical quantity is a property of a phenomenon, body, or
    substance, where the property has a magnitude that can be expressed
    as a number and a reference

Source: `International vocabulary of
metrology <http://www.bipm.org/utils/common/documents/jcgm/JCGM_200_2012.pdf>`__

General Information :: Links
''''''''''''''''''''''''''''

-  Bureau International des Poids et Mesures
   `BIPM <http://www.bipm.org>`__
-  National Institute of Standards and Technology
   `NIST <http://www.nist.gov/>`__

The domain PhysQty (abbrev. PQTY) implements physical quantities. The
implementation is based on the following category and domains:

-  Rational interval arithmetics ... `RIA <RIA.html>`__
-  Category ``PhysicalUnit`` ... `PUNIT <PUNIT.html>`__
-  SI Units ... `SI <SI.html>`__

General Form
------------

A physical quantity in PQTY comprises three components:

-  ``v``, value (rational)
-  ``e``, uncertainty (rational)
-  ``u``, unit (e.g. type SI\_UNIT)

All base calculations are done by interval propagation of the interval
``[v-e,v+e]``. Thus an element of the type ``PhysQty`` has the form
:math:`[v-e,v+e] \times u`.

Constructors and query functions
--------------------------------

::

        pqty: (Q, Q, U) -> %    
        
        pqtyValue: % -> Q  -- get the value
        pqtyError: % -> Q  -- get the uncertainty
        pqtyUnit:  % -> U  -- get the unit
        
        pqtyInterval: % -> QI  -- get the interval [v-delta,v+delta]
        pqtyScale: (%,Q) -> %  -- scale by rational number

Basic Operations
----------------

::

        "*": (%,%) -> %
        "/": (%,%) -> %
        "+": (%,%) -> %
        "-": (%,%) -> %
        "^": (%,Integer) -> %
        "-":  % -> %
        elt: (Q, %) -> %
        elt: (QI,U) -> %
        elt: (Union(Q,F,R,I),U) -> %
        coerce : % -> OutputForm

In order to use the libary we have to load it and all its dependencies:

.. code:: python

    )lib RIA PUNIT SI PQTY


.. parsed-literal::

       RationalInterval is now explicitly exposed in frame initial 
       RationalInterval will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/RIA.NRLIB/RIA
       PhysicalUnit is now explicitly exposed in frame initial 
       PhysicalUnit will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/PUNIT.NRLIB/PUNIT
       SIunit is now explicitly exposed in frame initial 
       SIunit will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/SI.NRLIB/SI
       PhysQty is now explicitly exposed in frame initial 
       PhysQty will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/PQTY.NRLIB/PQTY
    




.. parsed-literal::

    



.. code:: python

    Q ==> Fraction Integer




.. parsed-literal::

                                                                       Type: Void




pqty - the main constructor
---------------------------

For instance let us create the quantity
:math:`g=9.81\pm0.05 \frac{m}{s^2}`:

.. code:: python

    g := pqty(9.81::Q, 0.05::Q, %m(1)/%s(2))


.. parsed-literal::

    Warning: HyperTeX macro table not found




.. parsed-literal::

                    1 - 2
       9.81 ± 0.05 m s
                                                            Type: PhysQty(SIunit)




Now ``g`` has type ``PhysQty(SI_UNIT)``. If we had entered units of an
other system we would get a different representation, for instance of
type ``PhysQty(CGS_UNIT)``, however, still the same object.

**Note**: all numeric arguments in ``PQTY`` have to be rationals,
although this might not be seen on first sight. Either one has to
``coerce`` the figures oneself or it will be done automatically by
certain ``elt`` functions.

How can we recover ``u,v,e`` from the object ``g``?

pqty\_interval
^^^^^^^^^^^^^^

.. code:: python

    pqtyInterval g




.. parsed-literal::

        244 493
       [---,---]
         25  50
                                                           Type: RationalInterval




Here we can see how the value :math:`9.81\pm 0.05` has been converted to
a rational interval. Now we could use the functions ``lb,ub`` from the
domain ``Q_INTERVAL`` to get the lower and upper bound.

pqty\_value
^^^^^^^^^^^

This function recovers the value:

.. code:: python

    pqtyValue g




.. parsed-literal::

       981
       ---
       100
                                                          Type: Fraction(Integer)




pqty\_error
^^^^^^^^^^^

This function recovers the uncertainty:

.. code:: python

    pqtyError g




.. parsed-literal::

        1
       --
       20
                                                          Type: Fraction(Integer)




pqty\_unit
^^^^^^^^^^

This function recovers the unit:

.. code:: python

    pqtyUnit g




.. parsed-literal::

        1 - 2
       m s
                                                                     Type: SIunit




pqty\_scale If we want double the quantity ``g`` we can either use the
constructor ``pqty`` to create the object ``g2`` or we may apply the
scaling function to ``g``:

pqtyScale
^^^^^^^^^

.. code:: python

    g2 := pqtyScale(g,2)




.. parsed-literal::

                    1 - 2
       19.62 ± 0.1 m s
                                                            Type: PhysQty(SIunit)




**Note**: although these low-level methods are the safe and recommended
one, they are not very convenient. For calculations without
``uncertainties`` one may use the following method:

ELT method
^^^^^^^^^^

.. code:: python

    area := 123.45 %m(2)




.. parsed-literal::

                     2
       123.45 ± 0.0 m
                                                            Type: PhysQty(SIunit)




.. code:: python

    force := 56.777 SIderived("newton")




.. parsed-literal::

                     1  1 - 2
       56.777 ± 0.0 m kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    pressure := force / area




.. parsed-literal::

                                      - 1  1 - 2
       0.4599189955_4475496152 ± 0.0 m   kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- actually:
    pqtyInterval pressure




.. parsed-literal::

         56777  56777
       [------,------]
        123450 123450
                                                           Type: RationalInterval




.. code:: python

    -- the interval represents a value without uncertainty, indeed we have
    len %




.. parsed-literal::

       0
                                                          Type: Fraction(Integer)




At the moment this is the only method implemented to create a ``PQTY``
object without the main constructor. Possibly there will be a method to
enter the so called ``concise`` form.

Examples of basic operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

    -- we cannot add different units
    force + g


.. parsed-literal::

    TYPE-ERROR: 
      #<TYPE-ERROR expected-type: CONS datum: NIL>




.. parsed-literal::

    



.. code:: python

    -- but we can multiply or divide them
    force*g




.. parsed-literal::

                            2  1 - 4
       556.98237 ± 2.83885 m kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    M:=force/g




.. parsed-literal::

                                                          1
       5.7878160018_953878895 ± 0.0294995718_7510391381 kg
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- we can invert a quantity, even it makes no sense physically !?
    -M




.. parsed-literal::

                                                            1
       - 5.7878160018_953878895 ± 0.0294995718_7510391381 kg
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- scaling (not 2*g !!)
    2 g




.. parsed-literal::

                    1 - 2
       19.62 ± 0.1 m s
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- recall g2 above
    g2 - 2 g




.. parsed-literal::

                  1 - 2
       0.0 ± 0.2 m s
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- error usually is not zero when e<>0.
    pqtyError %




.. parsed-literal::

       1
       -
       5
                                                          Type: Fraction(Integer)




.. code:: python

    -- exponentiation
    pressure^2




.. parsed-literal::

                                      - 2  2 - 4
       0.2115254824_6289633415 ± 0.0 m   kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    force^(3)




.. parsed-literal::

                               3  3 - 6
       183027.911569433 ± 0.0 m kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- error is zero, because e=0.
    force  - force




.. parsed-literal::

                  1  1 - 2
       0.0 ± 0.0 m kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    (6.344::Q) force




.. parsed-literal::

                         1  1 - 2
       360.193288 ± 0.0 m kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    (%pi::Float::Q) g 




.. parsed-literal::

                                                         1 - 2
       30.8190239317_15871669 ± 0.1570796326_7948966192 m s
                                                            Type: PhysQty(SIunit)




Write your own functions
~~~~~~~~~~~~~~~~~~~~~~~~

This low level library covers almost everything such that one can write
extensions. As an exmaple let us create a function ``add_error`` which
adds an uncertainty to a given quantity and returns the result as a new
instance.

.. code:: python

    addError(qty, err) ==
        v:= pqtyValue qty
        e:= (pqtyError qty)+err 
        u:= pqtyUnit qty
        return pqty(v,e,u)
    
      




.. parsed-literal::

                                                                       Type: Void




.. code:: python

    addError(pressure,1/3)




.. parsed-literal::

                                                          - 1  1 - 2
       0.4599189955_4475496152 ± 0.3333333333_3333333333 m   kg s
                                                            Type: PhysQty(SIunit)




.. code:: python

    -- comapre to pressure:
    pressure




.. parsed-literal::

                                      - 1  1 - 2
       0.4599189955_4475496152 ± 0.0 m   kg s
                                                            Type: PhysQty(SIunit)




