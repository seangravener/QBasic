'Sean Gravener 2/7/98 period 3
'Games.bas
'This will find certain data facts pertaining to a softball game
'**************************************************************************************************
CLS
SCREEN 0
DIM name$(15)
DIM hits(15, 10)
DIM totalhits(15)
DIM totalgame(10)
GOSUB GetArrays
GOSUB Total
GOSUB GameTotal
DO
   GOSUB Menu
LOOP UNTIL pick = 6

DATA Adams, Berryhill, Dowing, Edwards, Franks, Grady, Howard, Jones, Martin, Powers, Smith, Smithtown, Townsend, Ulmer, Williams
DATA 2,1,0,0,2,3,3,1,1,2
DATA 1,0,3,2,5,1,2,2,1,0
DATA 1,0,2,1,0,0,0,0,2,0
DATA 0,3,6,4,6,4,5,3,6,3
DATA 2,2,3,2,1,0,2,3,2,0
DATA 1,3,2,0,1,5,2,1,2,1
DATA 3,1,1,1,2,0,1,0,4,3
DATA 2,2,1,2,4,1,0,7,1,0
DATA 5,4,5,1,1,0,2,4,1,5
DATA 2,2,3,1,0,2,1,3,1,2
DATA 1,1,2,1,3,4,1,0,3,2
DATA 1,0,1,2,1,0,3,4,1,2
DATA 0,0,0,0,0,0,1,0,0,0
DATA 2,2,2,2,2,4,4,3,1,3
DATA 2,3,1,0,1,2,1,2,0,3

END

GetArrays:  'Reads the data into arrays
FOR nam = 1 TO 15 'Read names into an array
   READ name$(nam)
NEXT nam
FOR row = 1 TO 15  'Read the hits into an array
   FOR col = 1 TO 10
      READ hits(row, col)
   NEXT
NEXT

Total:  'adds all the rows togehter
FOR row = 1 TO 15
   FOR col = 1 TO 10
      totalhits(row) = hits(row, col) + totalhits(row)
   NEXT col
NEXT row
RETURN

GameTotal: 'adds all the coloms together
FOR row = 1 TO 15
   FOR col = 1 TO 10
      totalgame(col) = hits(row, col) + totalgame(col)
   NEXT col
NEXT row
RETURN

Menu:  'the menu that the user chooses from
CLS
LOCATE 10, 10: PRINT "SOFTBALL HIT RECORD"
LOCATE 11, 10: PRINT "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
LOCATE 12, 10: PRINT "1)Total Hits for the Season..."
LOCATE 13, 10: PRINT "2)Name of player with most hits..."
LOCATE 14, 10: PRINT "3)Name of player with fewest hits..."
LOCATE 15, 10: PRINT "4)Game with most hits..."
LOCATE 16, 10: PRINT "5)Game with fewest hits..."
LOCATE 17, 10: PRINT "6)Exit this program..."
LOCATE 18, 8: INPUT "Please select a # shown: ", pick
ON pick GOSUB Table, Mhits, FHits, Gmost, Gfew, Quit
RETURN

Table: 'Prints a chart for the games
CLS
PRINT "------------------------------------------------------------------------"
PRINT "Name:       Game1 Game2 Game3 Game4 Game5 Game6 Game7 Game8 Game9 Game10"
PRINT "------------------------------------------------------------------------"
x = 5
FOR nameprint = 1 TO 15  'Makes the chart for the table...
  LOCATE x, 1: PRINT name$(nameprint); TAB(15);
  FOR name2 = 1 TO 10
     PRINT hits(nameprint, name2); SPC(3);
  NEXT name2
  x = x + 1
NEXT nameprint
PRINT "-------------------------------------------------------------------------"
PRINT "Space to continue..."
DO
LOOP UNTIL INKEY$ = " "
FOR index = 1 TO 15
   PRINT name$(index), totalhits(index)
NEXT index
PRINT "Space to continue..."
DO
LOOP UNTIL INKEY$ = " "
RETURN

Mhits: 'Finds the name of the player that hit the most and prints it
CLS
LOCATE 2, 1: PRINT "|Player|", "|Hits|"
high = totalhits(1)
FOR go = 1 TO 15
   IF totalhits(go) > high THEN high = totalhits(go): name$ = name$(go)
NEXT
PRINT name$, high
PRINT "Space to continue..."
DO  'Waits for the Space bar to be pressed.........
LOOP UNTIL INKEY$ = " "
RETURN

FHits:  'finds the player with the least amount of hits
CLS
LOCATE 2, 1: PRINT "|Player|", "|Hits|"
low = totalhits(1)
FOR go = 1 TO 15
   IF totalhits(go) < low THEN low = totalhits(go): name$ = name$(go)
NEXT
PRINT name$, low
PRINT "Space to continue..."
DO  'Waits for the Space bar to be pressed.........
LOOP UNTIL INKEY$ = " "
RETURN

Gmost:  'Finds the game with the most hits
game% = 0
CLS
LOCATE 2, 1: PRINT "|Game|", "|Hits|"
high = totalgame(1)
FOR go = 1 TO 10
   IF totalgame(go) > high THEN high = totalgame(go): game% = go  'Checks out if any of the other game totals are bigger than the first game
NEXT
PRINT game%, high
PRINT "Space to continue..."
DO  'Waits for the Space bar to be pressed.........
LOOP UNTIL INKEY$ = " "
RETURN


Gfew: 'Finds the lowest total game hits and game #
game% = 0
CLS
LOCATE 2, 1: PRINT "|Game|", "|Hits|"
low = totalgame(1)
FOR go = 1 TO 10
   IF totalgame(go) < low THEN low = totalgame(go): game% = go
NEXT
PRINT game%, low
PRINT "Space to continue..."
DO  'Waits for the Space bar to be pressed.........
LOOP UNTIL INKEY$ = " "
RETURN

Quit:
END

