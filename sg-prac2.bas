DECLARE SUB box (row!, col!)
DECLARE SUB count ()
DECLARE FUNCTION money! (disks!, cost!)
'Sean Gravener - Period 3 - 2-27-98
CLS


'-1-
'Function procuduer that returns the total amount of money you have spent
'on disks in the past year...
INPUT "Enter # of disks:", disks
INPUT "Enter cost of 1 disk: $", cost
PRINT USING "$$##.##"; money(disks!, cost!)

'-2-
'Counts the number of times this SUB is called using a local variable
done = 0
DO
   done = done + 1
   count
LOOP UNTIL done = 5

'-3-
'Sub procudure that draws a box using ASCII codes. 
INPUT "how Many Rows: ", row
INPUT "How Many Coloms: ", col
box row, col

SUB box (row, col)
   CLS
   box1$ = "Í"
   box2$ = "»"
   box3$ = "È"
   box4$ = "¼"
   box5$ = "É"
   box6$ = "º"
   LOCATE 1, 1: PRINT box5$;
   FOR index = 1 TO row
      PRINT box1$;
   NEXT
   LOCATE 1, row: PRINT box2$,
   FOR index2 = 1 TO col
      PRINT box6$
   NEXT
   LOCATE col, 1: PRINT box3$;
   FOR index3 = 1 TO row
      PRINT box1$;
   NEXT
   LOCATE col, row: PRINT box4$
END SUB

SUB count
   STATIC xx
   xx = xx + 1
   PRINT "The Number of times this subroutine has been called is: "; xx
END SUB

FUNCTION money (disks, cost)
   'This FUNCTION multiplies the total number of disks by the cost of each one.
   money = disks * cost
END FUNCTION

