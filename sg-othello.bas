DECLARE SUB Rules ()
DECLARE SUB Menu (current)
DECLARE SUB Intro ()
DECLARE SUB preseter (board!())
DECLARE SUB piece (Player)
DECLARE SUB DoTheMath (Player!, board())
DECLARE SUB Display (Player)
DECLARE SUB box (Col!, Row!, Size!, Size2!, Pink!)
'Sean Gravener
'The game of Othello
'a game

'***********************************
'Box (Col, Row, Size, Size2, Pink) *
'Col   = colom(up and down)        *
'Row   = Row(left and right)       *
'Size  = The size of the colom     *
'Size2 = The size of the row       *
'Pink  = The color of the box      *
'***********************************                                  

DO
   CLS : SCREEN 12
   Player = 1
   DIM board(12, 13)

   DO
      'Menu Boxes------------------
      CALL box(9, 11, 9, 8, 9)  ' -
      CALL box(10, 15, 1, 1, 8) ' -
      CALL box(13, 15, 1, 1, 8) ' -
      CALL box(16, 15, 1, 1, 8) ' -
      '----------------------------
      CALL Menu(current)
      IF current = 2 THEN CALL Rules
      IF current = 3 THEN END
   LOOP UNTIL current <> 2
   
   CALL Intro
   CALL Display(Player)
   CALL preseter(board())
   
   'Make screen---------------------------------------------
   CALL box(1, 1, 24, 25, 2)       'game board box         -
   CALL box(1, 50, 5, 5, 14)       'upper right hand box   -
   CALL box(10, 50, 5, 5, 4)       'middle right hand box  -
   CALL box(20, 50, 5, 5, 5)       'lower right hand box   -
   '--------------------------------------------------------

   COLOR 15: LOCATE 1, 15: PRINT "The Next Door Game"
   CALL DoTheMath(Player, board()) 'Were all the things are calculated
LOOP UNTIL current = 3

END

SUB box (Col, Row, Size, Size2, Pink)
   COLOR Pink
   LOCATE Col, Row: PRINT "Щ"
   col2 = Col
   FOR index = 1 TO Size
      col2 = col2 + 1
      LOCATE col2, Row: PRINT "К"
      LOCATE col2, Row + Size2 + 21: PRINT "К"
   NEXT index
 
   LOCATE col2 + 1, Row: PRINT "Ш"
   row2 = Row
   FOR index = 1 TO Size2 + 21
      row2 = row2 + 1
      LOCATE Col, row2: PRINT "Э"
      LOCATE Col + Size + 1, row2: PRINT "Э"
   NEXT index

   LOCATE Col, row2: PRINT "Л"
   LOCATE col2 + 1, row2: PRINT "М"
END SUB

SUB Display (Player)
   'PAINT (1, 1), 8
   COLOR 14: LOCATE 17, 55: PRINT "- Press Q to quit -"
   COLOR 15: LOCATE 4, 57: PRINT "Player: "; Player
   COLOR 15: LOCATE 21, 60: PRINT "Score: "
   'Game grid______
   X = 8
   FOR index = 1 TO 14
      LINE (7, X)-(369, X), 8
      X = X + 30
   NEXT index
   x1 = 7
   FOR index = 1 TO 13
      LINE (x1, 8)-(x1, 410), 8
      x1 = x1 + 30
   NEXT index
   
END SUB

SUB DoTheMath (Player, board())
'***************** ***************** ***************** *****************

 DO
   X = 22
   y = 23
   xindex = 1
   yindex = 1
   Flag = 0
   DO           'Player one
      DO
         Push$ = INKEY$
         CIRCLE (X, y), 10, 9: CIRCLE (X, y), 5, 14
         x2 = X:  y2 = y
         IF Push$ = CHR$(0) + "M" THEN X = X + 30: xindex = xindex + 1
         IF Push$ = CHR$(0) + "P" THEN y = y + 30: yindex = yindex + 1
         IF Push$ = CHR$(0) + "K" THEN X = X - 30: xindex = xindex - 1
         IF Push$ = CHR$(0) + "H" THEN y = y - 30: yindex = yindex - 1
         'Dimentions
         IF X < 22 THEN X = 22
         IF y < 23 THEN y = 23
         IF y > 383 THEN y = 383
         IF X > 352 THEN X = 352
         IF xindex < 1 THEN xindex = 1
         IF yindex < 1 THEN yindex = 1
         IF xindex > 11 THEN xindex = 12
         IF yindex > 13 THEN yindex = 13
      LOOP UNTIL UCASE$(Push$) <> ""
      IF board(xindex, yindex) <> 0 THEN LOCATE 12, 55: COLOR 15: PRINT "Occupied!": Flag = 1
      IF Flag = 0 THEN LOCATE 12, 55: COLOR 0: PRINT "ллллллллллллллл"
      CIRCLE (x2, y2), 10, 0: CIRCLE (x2, y2), 5, 0
      IF Push$ = CHR$(13) THEN board(xindex, yindex) = 1: CIRCLE (X, y), 15, 9
      location = board(xindex, yindex)
   LOOP UNTIL Push$ = CHR$(13) OR UCASE$(Push$) = "Q"
   IF UCASE$(Push$) = "Q" THEN EXIT DO
     
   IF Player = 1 THEN Player = 2 ELSE Player = 1
   IF Player = 1 THEN
      LOCATE 4, 57: COLOR 15
      PRINT "Player: "; Player
   ELSE
      LOCATE 10, 57: COLOR 9
      PRINT "Player: "; Player
   END IF

   IF xindex < 12 THEN IF board(xindex + 1, yindex) = 2 THEN CIRCLE (X + 30, y), 15, 9: board(xindex + 1, yindex) = 1
   IF xindex < 12 AND yindex < 13 THEN IF board(xindex + 1, yindex + 1) = 2 THEN CIRCLE (X + 30, y + 30), 15, 9: board(xindex + 1, yindex + 1) = 1
   IF yindex < 13 THEN IF board(xindex, yindex + 1) = 2 THEN CIRCLE (X, y + 30), 15, 9: board(xindex, yindex + 1) = 1
   IF xindex > 1 THEN IF board(xindex - 1, yindex) = 2 THEN CIRCLE (X - 30, y), 15, 9: board(xindex - 1, yindex) = 1
   IF xindex > 1 AND yindex > 1 THEN IF board(xindex - 1, yindex - 1) = 2 THEN CIRCLE (X - 30, y - 30), 15, 9: board(xindex - 1, yindex - 1) = 1
   IF yindex > 1 THEN IF board(xindex, yindex - 1) = 2 THEN CIRCLE (X, y - 30), 15, 9: board(xindex, yindex - 1) = 1
   IF xindex < 12 AND yindex > 1 THEN IF board(xindex + 1, yindex - 1) = 2 THEN CIRCLE (X + 30, y - 30), 15, 9: board(xindex + 1, yindex - 1) = 1
   IF xindex > 1 AND yindex < 13 THEN IF board(xindex - 1, yindex + 1) = 2 THEN CIRCLE (X - 30, y + 30), 15, 9: board(xindex - 1, yindex + 1) = 1
  
   score1 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 1
      FOR yi = 1 TO 13
         IF board(xi, yi) = 1 THEN score1 = score1 + 1
      NEXT yi
   NEXT xi
  
   score2 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 2
      FOR yi = 1 TO 13
         IF board(xi, yi) = 2 THEN score2 = score2 + 1
      NEXT yi
   NEXT xi
  
   LOCATE 22, 55: COLOR 4: PRINT "Player 1:"; score1
   LOCATE 23, 55: COLOR 15: PRINT "Player 2:"; score2
  
   x2 = 352
   y2 = 383
   xindex = 13
   yindex = 13
   Flag = 0
   DO           'Player two
      DO
         Push$ = INKEY$
         CIRCLE (x2, y2), 10, 15: CIRCLE (x2, y2), 5, 14
         x3 = x2:  y3 = y2
         IF Push$ = CHR$(0) + "M" THEN x2 = x2 + 30: xindex = xindex + 1
         IF Push$ = CHR$(0) + "P" THEN y2 = y2 + 30: yindex = yindex + 1
         IF Push$ = CHR$(0) + "K" THEN x2 = x2 - 30: xindex = xindex - 1
         IF Push$ = CHR$(0) + "H" THEN y2 = y2 - 30: yindex = yindex - 1
         'dimentions
         IF x2 < 22 THEN x2 = 22
         IF y2 < 23 THEN y2 = 23
         IF y2 > 383 THEN y2 = 383
         IF x2 > 352 THEN x2 = 352
         IF xindex < 1 THEN xindex = 1
         IF yindex < 1 THEN yindex = 1
         IF xindex > 11 THEN xindex = 12
         IF yindex > 13 THEN yindex = 13
      LOOP UNTIL UCASE$(Push$) <> ""
      IF Flag = 0 THEN LOCATE 12, 55: COLOR 0: PRINT "ллллллллллллллл"
      IF board(xindex, yindex) <> 0 THEN LOCATE 12, 55: COLOR 15: PRINT "Occupied!": Flag = 1
      CIRCLE (x3, y3), 10, 0: CIRCLE (x3, y3), 5, 0
      IF Push$ = CHR$(13) THEN CIRCLE (x2, y2), 15, 15: board(xindex, yindex) = 2
      location = board(xindex, yindex)
   LOOP UNTIL Push$ = CHR$(13) OR UCASE$(Push$) = "Q"

   IF Player = 1 THEN Player = 2 ELSE Player = 1
   IF Player = 1 THEN
      LOCATE 4, 57: COLOR 15
      PRINT "Player: "; Player
   ELSE
      LOCATE 10, 57: COLOR 9
      PRINT "Player: "; Player
   END IF
  
   IF xindex < 12 THEN IF board(xindex + 1, yindex) = 1 THEN CIRCLE (x2 + 30, y2), 15, 15: board(xindex + 1, yindex) = 2
   IF xindex < 12 AND yindex < 13 THEN IF board(xindex + 1, yindex + 1) = 1 THEN CIRCLE (x2 + 30, y2 + 30), 15, 15: board(xindex + 1, yindex + 1) = 2
   IF yindex < 13 THEN IF board(xindex, yindex + 1) = 1 THEN CIRCLE (x2, y2 + 30), 15, 15: board(xindex, yindex + 1) = 2
   IF xindex > 1 THEN IF board(xindex - 1, yindex) = 1 THEN CIRCLE (x2 - 30, y2), 15, 15: board(xindex - 1, yindex) = 2
   IF xindex > 1 AND yindex > 1 THEN IF board(xindex - 1, yindex - 1) = 1 THEN CIRCLE (x2 - 30, y2 - 30), 15, 15: board(xindex - 1, yindex - 1) = 2
   IF yindex > 1 THEN IF board(xindex, yindex - 1) = 1 THEN CIRCLE (x2, y2 - 30), 15, 15: board(xindex, yindex - 1) = 2
   IF xindex < 12 AND yindex > 1 THEN IF board(xindex + 1, yindex - 1) = 1 THEN CIRCLE (x2 + 30, y2 - 30), 15, 15: board(xindex + 1, yindex - 1) = 2
   IF xindex > 1 AND yindex < 13 THEN IF board(xindex - 1, yindex + 1) = 1 THEN CIRCLE (x2 - 30, y2 + 30), 15, 15: board(xindex - 1, yindex + 1) = 2
   
   score1 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 1
      FOR yi = 1 TO 13
         IF board(xi, yi) = 1 THEN score1 = score1 + 1
      NEXT yi
   NEXT xi
  
   score2 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 2
      FOR yi = 1 TO 13
         IF board(xi, yi) = 2 THEN score2 = score2 + 1
      NEXT yi
   NEXT xi
  
   LOCATE 22, 55: COLOR 4: PRINT "Player 1:"; score1
   LOCATE 23, 55: COLOR 15: PRINT "Player 2:"; score2

 LOOP UNTIL UCASE$(Push$) = "Q"


END SUB

SUB Intro
   RANDOMIZE TIMER
   CLS
   FOR index = 1 TO 5           'Colored lines in background
      FOR I% = 1 TO 10
        COLOR I%: LINE STEP(x150!, x130!)-(300, 200)
        X = INT(720 * RND + 0)
        y = INT(720 * RND + 0)
        c = INT(75 * RND + 1)
        PSET (X, y), c
      NEXT I%
   NEXT index
  
  
   FOR index = 1 TO 600         'colored dots in background
      num = INT(1 + 455 * RND)
      num2 = INT(1 + 15 * RND)
      num3 = INT(1 + 640 * RND)
      LINE (num3, num)-(num3, num), num2
   NEXT index
 
END SUB

SUB Menu (current)
  current = 1
 
  LOCATE 8, 13: PRINT "...Game title..."
  DO
   IF current > 3 THEN current = 3
   IF current < 1 THEN current = 1
   COLOR 8: LOCATE 11, 20: PRINT ". Play Game . "
   COLOR 8: LOCATE 14, 20: PRINT ".   Rules   . "
   COLOR 8: LOCATE 17, 20: PRINT ". End Game  . "
   DO
      IF current = 1 THEN
         COLOR 9: LOCATE 11, 20: PRINT ".  Play Game. "
      END IF
      IF current = 2 THEN
         COLOR 9: LOCATE 14, 20: PRINT ".    Rules  . "
      END IF
      IF current = 3 THEN
         COLOR 9: LOCATE 17, 20: PRINT ".  End Game . "
      END IF
  
   Push$ = INKEY$
   LOOP UNTIL Push$ <> ""
   
   IF Push$ = CHR$(0) + "P" THEN current = current + 1              'down
   IF Push$ = CHR$(0) + "H" THEN current = current - 1              'up
  LOOP UNTIL Push$ = CHR$(13)

END SUB

SUB preseter (board())
   CIRCLE (202, 173), 15, 15: board(7, 6) = 2
   CIRCLE (172, 203), 15, 15: board(6, 7) = 2
   CIRCLE (172, 173), 15, 9: board(6, 6) = 1
   CIRCLE (202, 203), 15, 9: board(7, 7) = 1
END SUB

SUB Rules
   CLS

END SUB

