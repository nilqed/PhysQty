
# PhysQty - Physical Quantities

>A physical quantity is a property of a phenomenon, body, or substance,
>where the property has a magnitude that can be expressed as a number and a reference

Source: [International vocabulary of metrology](http://www.bipm.org/utils/common/documents/jcgm/JCGM_200_2012.pdf)

##### General Information :: Links
* Bureau International des Poids et Mesures [BIPM](http://www.bipm.org)
* National Institute of Standards and Technology [NIST](http://www.nist.gov/)


##### About this Implementation
`PhysQty` provides units and physical quantities for the [Fricas](http://fricas.sourceforge.net/) computer algebra system (a fork of Axiom). There is one new category `PhysicalUnit` (abbrev. `PUNIT`) and there are two new domains `SIunit` and `PhysQty` (abbrev. `SI` and `PQTY` respectively) which allow safe operations.

Another domain called `RationalInterval` (abbrev. `RIA`) cares for exact calculations by using *rational interval arithmetics*. 

## Installation

Get this repository:

    git clone https://kfp@bitbucket.org/kfp/physqty.git
    
Then change to the `physqty` folder and start `FriCAS`:

    fricas [options]
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

       RationalInterval is already explicitly exposed in frame initial 
       RationalInterval will be automatically loaded when needed from 
          /home/kfp/PhysQty/RIA.NRLIB/RIA
       SIunit is already explicitly exposed in frame initial 
       SIunit will be automatically loaded when needed from 
          /home/kfp/PhysQty/SI.NRLIB/SI
       PhysicalUnit is already explicitly exposed in frame initial 
       PhysicalUnit will be automatically loaded when needed from 
          /home/kfp/PhysQty/PUNIT.NRLIB/PUNIT
       PhysQty is already explicitly exposed in frame initial 
       PhysQty will be automatically loaded when needed from 
          /home/kfp/PhysQty/PQTY.NRLIB/PQTY
    



`-> t:Table(Symbol,SIunit):=table()`




       table()
                                                      Type: Table(Symbol,SIunit)





```SPAd
-> t.L := %m(1)
   t.T := %s(1)
   t.M := %kg(1)
   t.g := t.L / (t.T)^2
```



        1
       m
    
                                                                    Type: SIunit
        1
       s
    
                                                                    Type: SIunit
         1
       kg
    
                                                                    Type: SIunit
        1 - 2
       m s
    
                                                                    Type: SIunit






`-> t`




                 1 - 2      1     1     1
       table(g= m s   ,M= kg ,T= s ,L= m )
    
                                                      Type: Table(Symbol,SIunit)






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



#### Data
The following data is provided as `input` file (folder `data`):

* [CODATA 2014](http://physics.nist.gov/cuu/Constants/)
* [AWAIC](http://www.nist.gov/physlab/data/comp.cfm) Atomic Weights and Isotope Compositions 
* `PSE` - Periodic System of Elements
* SI tables
* Non SI tables

                                        
#### User/Reference Manual (preliminary)


* [RIA](http://kfp.bitbucket.org/pqty/RIA.html)
* [SI](http://kfp.bitbucket.org/pqty/SI.html)
* [PQTY](http://kfp.bitbucket.org/pqty/PQTY.html)
* [DATA](http://kfp.bitbucket.org/pqty/pqty_data.html)

In the subfolder `doc` you will find the notebooks (`.ipynb`)



