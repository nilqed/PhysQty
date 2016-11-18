
SI - International System of Units
==================================

The domain **``SI``** (abbrev. also **``SI``**) implements *SI Units*.
The standard reference for this topic is: *Bureau International des
Poids et Mesures* `BIPM <http://www.bipm.org>`__

The recommended practical system of units of measurement is the
International System of Units (Système International d'Unités, with the
international abbreviation SI). The SI is defined by the `SI
Brochure <http://www.bipm.org/en/publications/si-brochure/>`__, which is
published by the BIPM.

[De] Constructors
~~~~~~~~~~~~~~~~~

Base units
''''''''''

::

        %m   :  Integer -> %
        %kg  :  Integer -> %  
        %s   :  Integer -> %
        %A   :  Integer -> %
        %K   :  Integer -> %  
        %mol :  Integer -> % 
        %cd  :  Integer -> %

Compound construction/deconstructor
                                   

::

        mksi: List(Integer) -> %
        si2l: % -> List(Integer)

Derived units
'''''''''''''

::

        SI_derived : String -> %
        

To each function there is an example below.

In order to use the library we have to load it:

.. code:: python

    )set output tex on
    )lib SI


.. parsed-literal::

       SIunit is already explicitly exposed in frame initial 
       SIunit will be automatically loaded when needed from 
          /home/kfp/Development/physqty/Untitled Folder/SI.NRLIB/SI
    
    




.. parsed-literal::

    



Seven Base Units
----------------

Length (meter)
^^^^^^^^^^^^^^

The metre is the length of the path travelled by light in vacuum during
a time interval of ``1/299 792 458`` of a second.

::

    Symbol: m

.. code:: python

    %m(1) 


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
    {{m} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Mass (kilogram)
^^^^^^^^^^^^^^^

The kilogram is the unit of mass; it is equal to the mass of the
international prototype of the kilogram.

::

    Symbol: kg

.. code:: python

    %kg(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{kg} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Time (second)
^^^^^^^^^^^^^

The second is the duration of ``9 192 631 770`` periods of the radiation
corresponding to the transition between the two hyperfine levels of the
ground state of the caesium ``133`` atom.

::

    Symbol: s

.. code:: python

    %s(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{s} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Electric current (ampere)
^^^^^^^^^^^^^^^^^^^^^^^^^

The ampere is that constant current which, if maintained in two straight
parallel conductors of infinite length, of negligible circular
cross-section, and placed 1 m apart in vacuum, would produce between
these conductors a force equal to 2 x 10–7 newton per metre of length.

::

    Symbol: A

.. code:: python

    %A(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{A} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Thermodynamic temperature (kelvin)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The kelvin, unit of thermodynamic temperature, is the fraction 1/273.16
of the thermodynamic temperature of the triple point of water.

::

    Symbol: K

.. code:: python

    %K(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{K} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Amount of substance (mol)
^^^^^^^^^^^^^^^^^^^^^^^^^

-  The mole is the amount of substance of a system which contains as
   many elementary entities as there are atoms in 0.012 kilogram of
   carbon 12.
-  When the mole is used, the elementary entities must be specified and
   may be atoms, molecules, ions, electrons, other particles, or
   specified groups of such particles.

   ``Symbol: mol``

.. code:: python

    %mol(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{mol} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Luminous intensity (candela)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The candela is the luminous intensity, in a given direction, of a source
that emits monochromatic radiation of frequency 540 x :math:`10^{12}`
hertz and that has a radiant intensity in that direction of 1/683 watt
per steradian.

::

    Symbol: cd

.. code:: python

    %cd(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{cd} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Examples
''''''''

.. code:: python

    -- Volume (cubic meter)
    %m(3)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{m} \sp {3}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- Force (newton)
    F:=%kg(1)*%m(1)*%s(-2)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- Force again, i.e. input order does not matter 
    -- and %s(-2) is equivalent to divide by %s(2).
    %kg(1)/%s(2)*%m(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




**Note**

::

    the output ordering is fixed: m kg s A K mol cd. This is also the order of arguments for the compound constructor **`mksi`**.

mksi
----

The ``mksi`` (make SI) constructor creates a SI unit from a list of
exponents:

.. code:: python

    mksi [1,1,-2,0,0,0,0]




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- Lets make the unit for pressure = force/area
    p:=mksi [-1,1,-2,0,0,0,0]




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {-1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- Let's check:
    F/%m(2)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {-1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    mksi [1,1,1,1,1,1,1]




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{{{{{m} \sp {1}}}{{kg} \sp {1}}}{{s} \sp {1}}}{{A} \sp {1}}}{{K} \sp 
    {1}}}{{mol} \sp {1}}}{{cd} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- the "one" unit
    mksi [0,0,0,0,0,0,0]




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




si2l
----

The ``si2l`` function converts a SI unit to a list of its exponents,
i.e. it is the reverse function of ``mksi``:

.. code:: python

    si2l F




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
    1, \: 1, \: -2, \: 0, \: 0, \: 0, \: 0 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{List(Integer)}\)




.. code:: python

    si2l p




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
    -1, \: 1, \: -2, \: 0, \: 0, \: 0, \: 0 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{List(Integer)}\)




.. code:: python

    si2l %cd(6)




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
    0, \: 0, \: 0, \: 0, \: 0, \: 0, \: 6 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{List(Integer)}\)




.. code:: python

    %A(3) * %K(8)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{A} \sp {3}}}{{K} \sp {8}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    si2l %




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
    0, \: 0, \: 0, \: 3, \: 8, \: 0, \: 0 
    \right]
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{List(Integer)}\)




Derived Units
-------------

The *derived SI units* are built in for convenience. The lookup function
is ``SI_derived`` and expects as argument the name of the *derived
unit*. Note that those and their nomenclature are clearly defined by
BIPM:

::

    SIderived(s:String):% ==
          s = "hertz"     => %s(-1)
          s = "newton"    => %kg(1)*%m(1)*%s(-2)
          s = "pascal"    => %kg(1)*%m(-1)*%s(-2)
          s = "joule"     => %kg(1)*%m(2)*%s(-2)
          s = "watt"      => %kg(1)*%m(2)*%s(-3)
          s = "coulomb"   => %s(1)*%A(1)
          s = "volt"      => %kg(1)*%m(2)*%s(-3)*%A(-1)
          s = "farad"     => %kg(-1)*%m(-2)*%s(4)*%A(2)
          s = "ohm"       => %kg(1)*%m(2)*%s(-3)*%A(2)
          s = "siemens"   => %kg(-1)*%m(-2)*%s(3)*%A(2)
          s = "weber"     => %kg(1)*%m(2)*%s(-2)*%A(-1)
          s = "tesla"     => %kg(1)*%s(-2)*%A(-1)
          s = "henry"     => %kg(1)*%m(2)*%s(-2)*%A(-2)
          s = "lumen"     => %cd(1)
          s = "lux"       => %m(-2)*%cd(1)
          s = "becquerel" => %s(-1)
          s = "gray"      => %m(2)*%s(-2)
          s = "sievert"   => %m(2)*%s(-2)
          s = "katal"     => %s(-1)*%mol(1)
          error "Expected string name of a derived SI unit."

.. code:: python

    SIderived "pascal"




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {-1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    SIderived "tesla"




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{kg} \sp {1}}}{{s} \sp {-2}}}{{A} \sp {-1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    (SIderived "gray") * (SIderived "becquerel")




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{m} \sp {2}}}{{s} \sp {-3}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    Energy := SIderived "joule"
    Force  := SIderived "newton"




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {2}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    $$
    {{{{m} \sp {1}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    (Energy/Force)$SI




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{m} \sp {1}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




.. code:: python

    -- indeed Energy = Force * %m(1)
    Force*%m(1)




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    {{{{m} \sp {2}}}{{kg} \sp {1}}}{{s} \sp {-2}} 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{SIunit}\)




Test for equality
^^^^^^^^^^^^^^^^^

Use ``$`` if necessary:

.. code:: python

    (Energy = (Force * %m(1)))$SI




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    true 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Boolean}\)




.. code:: python

    (p=Force/%m(2))$SI




.. math::

    \(
    \def\sp{^}\def\sb{_}\def\leqno(#1){}
    \def\erf{\mathrm{erf}}\def\sinh{\mathrm{sinh}}
    \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}
    \def\csch{\mathrm{csch}}
    \require{color}
    \)
    
    $$
    true 
    \leqno(NIL)
    $$
    
    
    \(\\[3ex]\color{blue}\scriptsize\text{Boolean}\)




.. code:: python

    -- Error (actually 'meter' is a base unit and not derived)
    SIderived("meter")


.. parsed-literal::

     
       >> Error detected within library code:
       Expected string name of a derived SI unit.
    




.. parsed-literal::

    error




Next see **Buckingham :math:`\Pi` Theorem**

`Wikipedia <https://en.wikipedia.org/wiki/Buckingham_%CF%80_theorem>`__

