DECLARE SUB MaKe (x, y, text$)
SCREEN 12 'Sets screen mode
DIM carry(255) 'Dimentions the array

  'prints the text
  LOCATE 5, 5: PRINT "Wiggling Text :)   Space to continue..."
MaKe 10, 15, "[ - ? - ]"  'the sub used to wiggle text
  LOCATE 5, 5: COLOR 12: PRINT "Wiggling Sean's :)   Space to continue..."
MaKe 5, 5, "Sean Did This!"
  LOCATE 5, 5: COLOR 14: PRINT "Searching Binary code...                 "
MaKe 5, 5, "1101100111000"

SUB MaKe (x, y, text$)
RANDOMIZE TIMER 'Sets the randomized timer

DO
 num1 = INT(10 * RND + 1)  'Pickes a number between 10 and 1
 num2 = INT(50 * RND + 1)  'Pickes a number between 50 and 1
 
 FOR col = 1 TO 15  'does the colors 1 throuth 15
 COLOR num1: LOCATE num1 + 15, num2 + 10: PRINT text$ 'makes the text to move by choosing a ramdom location
 NEXT col
LOOP UNTIL INKEY$ = " "  'loops untill spacebar is pressed

END SUB

