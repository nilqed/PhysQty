
# PhysQty - Physical Quantities

>A physical quantity is a property of a phenomenon, body, or substance,
>where the property has a magnitude that can be expressed as a number and a reference

Source: [International vocabulary of metrology](http://www.bipm.org/utils/common/documents/jcgm/JCGM_200_2012.pdf)

##### General Information :: Links
* Bureau International des Poids et Mesures [BIPM](http://www.bipm.org)
* National Institute of Standards and Technology [NIST](http://www.nist.gov/)


##### About this Implementation
`PhysQty` provides units and physical quantities for the [Fricas](http://fricas.sourceforge.net/) computer algebra system (a fork of Axiom). There is one new category `PhysicalUnit` (abbrev. `PUNIT`) and there are two new domains `SI_UNIT` and `PhysQty` (abbrev. `SI` and `PQTY` respectively) which allow safe operations.

Another domain called `Q_INTERVAL` (abbrev. `RIA`) cares for exact calculations by using *rational interval arithmetics*. 

## Installation

Get this repository:

    git clone https://kfp@bitbucket.org/kfp/physqty.git
    
Then change to the `physqty` folder and start `FriCAS`:

    fricas -nox
    ...
    
    (1) -> )compile pqty.spad
    
    ...
    
    PhysQty is now explicitly exposed in frame frame1
    PhysQty will be automatically loaded when needed from
    ~/physqty/PQTY.NRLIB/PQTY
    
Next time one may use the library by the command:

    )lib RIA SI PUNIT PQTY
    
   

##### Quick check
If the installation was successful try the following commands which are looking for an expression of the oscillation period of a pendulum by using Buckinghams's theorem:




`-> )lib RIA SI PUNIT PQTY`

       Q_INTERVAL is already explicitly exposed in frame initial 
       Q_INTERVAL will be automatically loaded when needed from 
          /home/kfp/PhysQty/RIA.NRLIB/RIA
       SI_UNIT is already explicitly exposed in frame initial 
       SI_UNIT will be automatically loaded when needed from 
          /home/kfp/PhysQty/SI.NRLIB/SI
       PhysicalUnit is already explicitly exposed in frame initial 
       PhysicalUnit will be automatically loaded when needed from 
          /home/kfp/PhysQty/PUNIT.NRLIB/PUNIT
       PhysQty is already explicitly exposed in frame initial 
       PhysQty will be automatically loaded when needed from 
          /home/kfp/PhysQty/PQTY.NRLIB/PQTY
    





    





`-> t:Table(Symbol,SI_UNIT):=table()`




       table()
                                                      Type: Table(Symbol,SI_UNIT)





```SPAd
-> t.L := %m(1)
   t.T := %s(1)
   t.M := %kg(1)
   t.g := t.L / (t.T)^2
```



        1
       m
    
                                                                    Type: SI_UNIT
        1
       s
    
                                                                    Type: SI_UNIT
         1
       kg
    
                                                                    Type: SI_UNIT
        1 - 2
       m s
    
                                                                    Type: SI_UNIT






`-> t`




                 1 - 2      1     1     1
       table(g= m s   ,M= kg ,T= s ,L= m )
    
                                                      Type: Table(Symbol,SI_UNIT)






`-> r:=buck(t)` 





         L
       [---]
         2
        T g
                                                  Type: List(Expression(Integer))





`-> solve(r.1=1,T)`




            +-+       +-+
            |L        |L
       [T=  |- ,T= -  |- ]
           \|g       \|g
                                        Type: List(Equation(Expression(Integer)))




#### User Manual
coming soon ...

