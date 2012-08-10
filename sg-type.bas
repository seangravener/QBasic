'Sean Gravener - Period 3 - 3//98 -
'This program uses a User Defined Type to find the distance from points
'given by the user.  There is one one-D array used.
'TYPE.BAS

DECLARE SUB Sort (Array() AS ANY, Size!)
DECLARE SUB Display2 (Array() AS ANY, Size!)
DECLARE SUB Calculate (Array() AS ANY, Size!)
DECLARE SUB Display (Array() AS ANY, Size!)
DECLARE SUB GetInfo (Array() AS ANY, Size!)

CLS
Size = 5                          'The Size of the array

TYPE Record                       'The Defined Type Name.
   Xaxis AS INTEGER               'The part of the array where the X
                                  'axis points are kept.
   Yaxis AS INTEGER               'The part of the array where the Y
                                  'axis points are kept.
   Distance AS INTEGER            'The part of the array where the calculated and sorted
END TYPE                          'points are kept.

DIM Array(Size) AS Record         'The 1-D array

CALL GetInfo(Array(), (Size))     'Gets the points from the user
CALL Display(Array(), (Size))     'Prints what the user has enterd
CALL Calculate(Array(), (Size))   'Uses the formula to calculate Distance
CALL Sort(Array(), (Size))        'Sorts the calculated infomation
CALL Display2(Array(), (Size))    'Displays the sorted and calculated info

END

SUB Calculate (Array() AS Record, Size)
   '# Calculates using Distance formula #
   FOR index = 1 TO Size
      Array(index).Distance = SQR(Array(index).Xaxis ^ 2 + Array(index).Yaxis ^ 2)
   NEXT index
END SUB

SUB Display (Array() AS Record, Size)
   'Displays the infomation enterd by user
   CLS
   FOR index = 1 TO Size
      y = index + 2
      COLOR 15: LOCATE 2, 5: PRINT "You have EnTerd ThE FoLloWinG InFoMaTiOn..."
      COLOR index: LOCATE y, 5: PRINT "X Coord #"; index; ":"; Array(index).Xaxis
   NEXT index
   FOR index = 1 TO Size
      y = index + 2
      COLOR index: LOCATE y, 25: PRINT "Y Coord #"; index; ":"; Array(index).Yaxis
   NEXT index
   COLOR 9: LOCATE 8, 1: PRINT "ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ"

END SUB

SUB Display2 (Array() AS Record, Size)
   'Displays calculated and sorted info
   FOR index = 1 TO Size
      y = index + 15
      COLOR 15: LOCATE 15, 5: PRINT "ThE DiStAnCe iS..."
      COLOR index: LOCATE y, 5: PRINT "Distance #"; index; ":"; Array(index).Distance
   NEXT index
   COLOR 9: LOCATE 25, 1: PRINT "ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ"
END SUB

SUB GetInfo (Array() AS Record, Size)
   'Gets input from user
   COLOR 15: LOCATE 2, 10: PRINT "..UsEr-DeFiNeD tYpE..  "
   FOR index = 1 TO Size
      LOCATE 5, 5: PRINT "Please enter"; Size; "Coordanates for X: #"; index
      LOCATE 6, 7: INPUT "X Coord:", Array(index).Xaxis
   NEXT index
   FOR index = 1 TO Size
      LOCATE 5, 5: PRINT "Please enter"; Size; "Coordanates for Y: #"; index
      LOCATE 6, 7: INPUT "Y Coord:", Array(index).Yaxis
   NEXT index
END SUB

SUB Sort (Array() AS Record, Size)
   'Using the BUBBLE SORT to sort the array.
   Flag = 0
   Final = Size
   DO
      FOR i = 1 TO Final - 1
         IF Array(i).Distance > Array(i + 1).Distance THEN SWAP Array(i).Distance, Array(i + 1).Distance: Flag = 1
      NEXT
   Final = Final - 1
   LOOP UNTIL Final = 0
END SUB

