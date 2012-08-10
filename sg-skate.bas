'Sean Gravener
'Skate.bas
'This program will ask the users to enter 10 people's scores for a skating event.
'It will then ask for the 6 scores of the competors.  The program uses 2 1-dimential arrays and 1 2-dimential array.

OPTION BASE 1
LET amount = 10
DIM name$(amount)
DIM score(amount, 6)
DIM final(10)
flag = 0
flag2 = 0
DO  'Main program...
   GOSUB Menu
   IF flag = 1 THEN GOSUB PrintScore: flag = 0: GOSUB Menu
   GOSUB Getinfo
   GOSUB Sort
   GOSUB PrintScore
LOOP UNTIL pick = 2
END

Menu:
CLS
IF flag2 = 1 THEN PRINT "Please Choose 1 through 3...":
LOCATE 15, 15: PRINT "1)Enter Names and scores"
LOCATE 16, 15: PRINT "2)Exit"
LOCATE 17, 15: PRINT "3)Display results"
LOCATE 18, 15: INPUT "Enter choice: ", pick
IF pick = 2 THEN END
IF pick = 3 THEN flag = 1
IF pick > 3 THEN flag2 = 1: GOSUB Menu
RETURN

Getinfo:
CLS
FOR index = 1 TO amount
   LOCATE 11, 15: PRINT "Enter Skater "; index; "name: ": LOCATE 12, 15: INPUT "...", name$(index)
NEXT
CLS
FOR index2 = 1 TO amount
   FOR index = 1 TO 6
      LOCATE 11, 15: PRINT "please enter comepetor "; name$(index2); "'s #"; index; " score:"
      LOCATE 12, 15: INPUT "Enter Score :", score(index2, index)
      IF score(index2, index) > 6 THEN PRINT "ONLY up to 6.0!": IF index2 > 1 AND index > 1 THEN INPUT "Re-Enter Score :", score(index2 - 1, index - 1): CLS
   NEXT index
NEXT index2
RETURN

Sort:  'Finds the max and min scores and subtracs them from all the scores added and then dives the sum by 4
FOR i = 1 TO 10
   max = score(i, 1)
   min = score(i, 1)
   FOR i2 = 1 TO 6
      IF score(i, i2) > max THEN max = score(i, i2)
      IF score(i, i2) < min THEN min = score(i, i2)
      total = total + score(i, i2)
   NEXT i2
   average = (total - max - min) / 4
   final(i) = average
NEXT i
DO 'Uses the bubble sort to put the scores in Descending order
   count = count + 1
   FOR i = 1 TO amount - 1
      IF final(i) < final(i + 1) THEN SWAP final(i), final(i + 1): SWAP name$(i), name$(i + 1)
   NEXT
'Final = Final - 1
LOOP UNTIL count = 10
RETURN

PrintScore:  'Prints the output scores in order
CLS
PRINT "POSITION:", "NAME:", "SCORE:"
FOR index = 1 TO 10
   PRINT index,
   PRINT name$(index),
   PRINT final(index)
NEXT index
PRINT "Space to continue..."
DO
LOOP UNTIL INKEY$ = " "
RETURN

