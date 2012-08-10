'Sean Gravener - 1998
'Jaxx
'  A silly game for a class project. It started out as Othello.
'  The Box sub creats an ASCII box on the screen using the Locate statemant.
'I used a 2-dimentional(12x13) array for the playing field.  As the player
'moves up, down, left or right, cursor postion in the array is ajusted accordingly
'If the player moves up, 1 is added to the cursor postion, down, 1 is subtracted
'and so on...  When INKEY recieves a carrage return(enter), a loop searches
'the array for 1's and 2's. 1 being player 1 and 2 player 2.  The number of
'both 1's and 2's are put into varaibles and printed therefore giving a score.
'If a person has 0 of his/her color, the oppisite player wins.  Or, if the
'board is fully filled, the person with the most pieces wins.

'***How The Boxes are made**********
'Box (Col, Row, Size, Size2, Pink) *
'Col   = colom(up and down)        *
'Row   = Row(left and right)       *
'Size  = The size of the colom     *
'Size2 = The size of the row       *
'Pink  = The color of the box      *
'***********************************                            

DECLARE SUB Win2 ()             'All the subs used in the program
DECLARE SUB Win1 ()
DECLARE SUB Rules ()
DECLARE SUB Menu (Current, Slow)
DECLARE SUB Intro ()
DECLARE SUB Preseter (board!())
DECLARE SUB piece (Player)
DECLARE SUB DoTheMath (Player!, board(), win)
DECLARE SUB Display (Player)
DECLARE SUB Box (COL!, Row!, Size!, Size2!, Pink!)

Player = 1                      'Sets the Player to Player 1
Slow = 1000                     'Sets the speed of the menu and the 1s and 0s
DIM board(12, 13)               'Dimentions the game board array
 
DO
   CLS : SCREEN 12              'Sets screen mode to 640x480
   CALL Box(9, 11, 9, 8, 9)     'Draws the Menu Boxes...
   CALL Box(10, 15, 1, 1, 8)
   CALL Box(13, 15, 1, 1, 8)
   CALL Box(16, 15, 1, 1, 8)
   CALL Menu(Current, Slow)     'This sub has all the Menu routines.  Lets
   IF Current = 1 THEN          'you choose what you would like to do(Play,
      CLS                       'Look at rules, or End game).
      CALL Intro                'Sets the background for the playing area
      CALL Display(Player)      'Puts *some* of the text in spacific places
      CALL Preseter(board())    'Puts Blue and White piecs in pre-defined spots
      'Make screen---------------------------------------
      CALL Box(1, 1, 24, 25, 2) 'game board box         -
      CALL Box(1, 50, 5, 5, 14) 'upper right hand box   -
      CALL Box(10, 50, 5, 5, 4) 'middle right hand box  -
      CALL Box(20, 50, 5, 5, 5) 'lower right hand box   -
      '--------------------------------------------------
      CALL DoTheMath(Player, board(), win)      'The "main" sub.  Where all the
      IF win = 1 THEN CALL Win1                 'game moves and calculations
      IF win = 2 THEN CALL Win2                 'are made.
    END IF
    IF Current = 2 THEN
       CLS
       CALL Intro               'Sets backgound for the Rules screen
       CALL Box(5, 5, 11, 45, 4)
       CALL Box(20, 15, 5, 30, 5)
       CALL Rules               'Prints the rules and object of the game
    END IF
LOOP UNTIL Current = 3          'If the user chooses "End Game" ..current.. is set to
                                '3.  So if it sees that current is 3 it exits
                                'the loop and ends the program.
END

SUB Box (COL, Row, Size, Size2, Pink)
   COLOR Pink                           'The color of the box
   LOCATE COL, Row: PRINT "É"
   Col2 = COL
   FOR Index = 1 TO Size                'loops x amount of times to create a
      Col2 = Col2 + 1                   'long or short box
      LOCATE Col2, Row: PRINT "º"
      LOCATE Col2, Row + Size2 + 21: PRINT "º"
   NEXT Index
 
   LOCATE Col2 + 1, Row: PRINT "È"
   Row2 = Row
   FOR Index = 1 TO Size2 + 21          'loop for the lenth of the rows
      Row2 = Row2 + 1
      LOCATE COL, Row2: PRINT "Í"
      LOCATE COL + Size + 1, Row2: PRINT "Í"
   NEXT Index

   LOCATE COL, Row2: PRINT "»"
   LOCATE Col2 + 1, Row2: PRINT "¼"
END SUB

SUB Display (Player)
   COLOR 9: LOCATE 2, 55: PRINT "JaXX"
   COLOR 14: LOCATE 9, 55: PRINT "- Press Q to quit -"
   COLOR 9: LOCATE 4, 57: PRINT "Player: "; Player
   COLOR 15: LOCATE 21, 60: PRINT "Score: "
   'Game grid______
   X = 8
   FOR Index = 1 TO 14                  'Draws the Vertical lines
      LINE (7, X)-(369, X), 8
      X = X + 30
   NEXT Index
   x1 = 7
   FOR Index = 1 TO 13                  'Draws the Horazontal lines
      LINE (x1, 8)-(x1, 410), 8
      x1 = x1 + 30
   NEXT Index
   
END SUB

SUB DoTheMath (Player, board(), win)
'***************** ***************** ***************** *****************
   X = 22                       'Start position of player one
   Y = 23
   xindex = 1                   'Start coordanants of array
   yindex = 1
   Flag = 0
   First = 1
DO
 xindex = xin3
 yindex = yin3
 DO
   DO                           'Player one
      DO
         Occupied = 0           'If the space has a color there this is set to 1
         Push$ = INKEY$
         CIRCLE (X, Y), 10, 9: CIRCLE (X, Y), 5, 14
         x2 = X:  y2 = Y
         IF Push$ = CHR$(0) + "M" THEN X = X + 30: xindex = xindex + 1
         IF Push$ = CHR$(0) + "P" THEN Y = Y + 30: yindex = yindex + 1
         IF Push$ = CHR$(0) + "K" THEN X = X - 30: xindex = xindex - 1
         IF Push$ = CHR$(0) + "H" THEN Y = Y - 30: yindex = yindex - 1
         'Dimentions of playing field
         IF X < 22 THEN X = 22
         IF Y < 23 THEN Y = 23
         IF Y > 383 THEN Y = 383
         IF X > 352 THEN X = 352
         IF xindex < 1 THEN xindex = 1
         IF yindex < 1 THEN yindex = 1
         IF xindex > 11 THEN xindex = 12
         IF yindex > 13 THEN yindex = 13
         IF board(xindex, yindex) <> 0 THEN Occupied = 1
      LOOP UNTIL UCASE$(Push$) <> ""
      COLOR 5: LOCATE 5, 56: PRINT "Location: "; xindex; yindex
      CIRCLE (x2, y2), 10, 0: CIRCLE (x2, y2), 5, 0
      IF Occupied = 0 THEN
         IF Push$ = CHR$(13) THEN board(xindex, yindex) = 1: CIRCLE (X, Y), 15, 9
         COLOR 0: LOCATE 3, 52: PRINT "        "
      ELSE
         COLOR 14: LOCATE 3, 52: PRINT "OCCUPIED"
      END IF
      Location = board(xindex, yindex)
      xin3 = xindex
      yin3 = yindex
  
   Score1 = 0           'set to 0 so it dosen't keep adding to old score.
   FOR xi = 1 TO 12     'search the array for occupied spots for player 1
      FOR yi = 1 TO 13
         IF board(xi, yi) = 1 THEN Score1 = Score1 + 1
      NEXT yi
   NEXT xi
 
   Full = 0             'variable for a full board
   Score2 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 2
      FOR yi = 1 TO 13
         IF board(xi, yi) = 2 THEN Score2 = Score2 + 1
         IF board(xi, yi) = 2 OR board(xi, yi) = 1 THEN Full = Full + 1
      NEXT yi
   NEXT xi
 
   IF Full = 156 THEN                           'if the board is filled up,
      IF Score1 > Score2 THEN win = 1           'the person with the most
      IF Score2 > Score1 THEN win = 2           'of their color wins.
      EXIT DO
   END IF
   IF Score1 = 0 THEN win = 2: EXIT DO          'if player has no pieces, the
   IF Score2 = 0 THEN win = 1: EXIT DO          'opposite player wins
  
   LOOP UNTIL Push$ = CHR$(13) OR UCASE$(Push$) = "Q"
   IF UCASE$(Push$) = "Q" THEN EXIT DO
    
   'Changes players turn
  IF Occupied = 0 THEN
   IF Player = 1 THEN Player = 2 ELSE Player = 1
   IF Player = 1 THEN
      COLOR 9: LOCATE 4, 57: PRINT "Player: "; Player
      LOCATE 12, 57: PRINT "Blues Turn..."
   END IF
   IF Player = 2 THEN
      COLOR 15: LOCATE 12, 57: PRINT "Player: "; Player
      LOCATE 4, 57: PRINT "Whites Turn..."
   END IF
  END IF
        'If user chooses this spot, this draws a new circle and incraments the array to 1 for player 1
  IF Occupied = 0 THEN
   IF xindex < 12 THEN IF board(xindex + 1, yindex) = 2 THEN CIRCLE (X + 30, Y), 15, 9: board(xindex + 1, yindex) = 1
   IF xindex < 12 AND yindex < 13 THEN IF board(xindex + 1, yindex + 1) = 2 THEN CIRCLE (X + 30, Y + 30), 15, 9: board(xindex + 1, yindex + 1) = 1
   IF yindex < 13 THEN IF board(xindex, yindex + 1) = 2 THEN CIRCLE (X, Y + 30), 15, 9: board(xindex, yindex + 1) = 1
   IF xindex > 1 THEN IF board(xindex - 1, yindex) = 2 THEN CIRCLE (X - 30, Y), 15, 9: board(xindex - 1, yindex) = 1
   IF xindex > 1 AND yindex > 1 THEN IF board(xindex - 1, yindex - 1) = 2 THEN CIRCLE (X - 30, Y - 30), 15, 9: board(xindex - 1, yindex - 1) = 1
   IF yindex > 1 THEN IF board(xindex, yindex - 1) = 2 THEN CIRCLE (X, Y - 30), 15, 9: board(xindex, yindex - 1) = 1
   IF xindex < 12 AND yindex > 1 THEN IF board(xindex + 1, yindex - 1) = 2 THEN CIRCLE (X + 30, Y - 30), 15, 9: board(xindex + 1, yindex - 1) = 1
   IF xindex > 1 AND yindex < 13 THEN IF board(xindex - 1, yindex + 1) = 2 THEN CIRCLE (X - 30, Y + 30), 15, 9: board(xindex - 1, yindex + 1) = 1
  END IF

   IF win <> 0 THEN EXIT DO

   LOCATE 22, 55: COLOR 4: PRINT "Player 1:"; Score1
   LOCATE 23, 55: COLOR 15: PRINT "Player 2:"; Score2
  
LOOP UNTIL Occupied = 0 OR Push$ = "Q" OR win <> 0
IF UCASE$(Push$) = "Q" OR win <> 0 THEN EXIT DO
  
  IF First = 1 THEN
   x3 = 352             'Sets start position for player 2
   y3 = 383
   xindex = 13          'Sets start position for the array
   yindex = 13
   Flag = 0
  END IF


 DO
  IF First = 0 THEN
     x3 = xax
     y3 = yax
     xindex = xin2
     yindex = yin2
  END IF
   DO                   'Player two
      DO
         Occupied = 0
         Push$ = INKEY$
         CIRCLE (x3, y3), 10, 15: CIRCLE (x3, y3), 5, 14
         x4 = x3:  y4 = y3
         IF Push$ = CHR$(0) + "M" THEN x3 = x3 + 30: xindex = xindex + 1
         IF Push$ = CHR$(0) + "P" THEN y3 = y3 + 30: yindex = yindex + 1
         IF Push$ = CHR$(0) + "K" THEN x3 = x3 - 30: xindex = xindex - 1
         IF Push$ = CHR$(0) + "H" THEN y3 = y3 - 30: yindex = yindex - 1
         'dimentions
         IF x3 < 22 THEN x3 = 22
         IF y3 < 23 THEN y3 = 23
         IF y3 > 383 THEN y3 = 383
         IF x3 > 352 THEN x3 = 352
         IF xindex < 1 THEN xindex = 1
         IF yindex < 1 THEN yindex = 1
         IF xindex > 11 THEN xindex = 12
         IF yindex > 13 THEN yindex = 13
         IF board(xindex, yindex) <> 0 THEN Occupied = 1
      LOOP UNTIL UCASE$(Push$) <> ""
      COLOR 5: LOCATE 13, 56: PRINT "Location: "; xindex; yindex
      CIRCLE (x4, y4), 10, 0: CIRCLE (x4, y4), 5, 0
      IF Occupied = 0 THEN
         IF Push$ = CHR$(13) THEN board(xindex, yindex) = 2: CIRCLE (x3, y3), 15, 15
         COLOR 0: LOCATE 11, 52: PRINT "        "
      ELSE
         COLOR 14: LOCATE 11, 52: PRINT "OCCUPIED"
      END IF
      Location = board(xindex, yindex)
      xax = x4: yax = y4
      xin2 = xindex
      yin2 = yindex
  
   Score1 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 1
      FOR yi = 1 TO 13
         IF board(xi, yi) = 1 THEN Score1 = Score1 + 1
      NEXT yi
   NEXT xi
 
   Score2 = 0
   FOR xi = 1 TO 12     'search the array for occupied spots for player 2
      FOR yi = 1 TO 13
         IF board(xi, yi) = 2 THEN Score2 = Score2 + 1
      NEXT yi
   NEXT xi
 
   IF Full = 156 THEN                           'if the board is filled up,
      IF Score1 > Score2 THEN win = 1           'the person with the most
      IF Score2 > Score1 THEN win = 2           'of their color wins.
      EXIT DO
   END IF
   IF Score1 = 0 THEN win = 2: EXIT DO
   IF Score2 = 0 THEN win = 1: EXIT DO
  
   LOOP UNTIL Push$ = CHR$(13) OR UCASE$(Push$) = "Q"


   'Changes the player
  IF Occupied = 0 THEN
   IF Player = 1 THEN Player = 2 ELSE Player = 1
   IF Player = 1 THEN
      COLOR 9: LOCATE 4, 57: PRINT "Player: "; Player
      LOCATE 12, 57: PRINT "Blues Turn..."
   END IF
   IF Player = 2 THEN
      COLOR 15: LOCATE 12, 57: PRINT "Player: "; Player
      LOCATE 4, 57: PRINT "Whites Turn..."
   END IF
  END IF
  
   'if user chooses spot, a new circle is drawn and the array is incramented to 2 for that spot
  IF Occupied = 0 THEN
   IF xindex < 12 THEN IF board(xindex + 1, yindex) = 1 THEN CIRCLE (x3 + 30, y3), 15, 15: board(xindex + 1, yindex) = 2
   IF xindex < 12 AND yindex < 13 THEN IF board(xindex + 1, yindex + 1) = 1 THEN CIRCLE (x3 + 30, y3 + 30), 15, 15: board(xindex + 1, yindex + 1) = 2
   IF yindex < 13 THEN IF board(xindex, yindex + 1) = 1 THEN CIRCLE (x3, y3 + 30), 15, 15: board(xindex, yindex + 1) = 2
   IF xindex > 1 THEN IF board(xindex - 1, yindex) = 1 THEN CIRCLE (x3 - 30, y3), 15, 15: board(xindex - 1, yindex) = 2
   IF xindex > 1 AND yindex > 1 THEN IF board(xindex - 1, yindex - 1) = 1 THEN CIRCLE (x3 - 30, y3 - 30), 15, 15: board(xindex - 1, yindex - 1) = 2
   IF yindex > 1 THEN IF board(xindex, yindex - 1) = 1 THEN CIRCLE (x3, y3 - 30), 15, 15: board(xindex, yindex - 1) = 2
   IF xindex < 12 AND yindex > 1 THEN IF board(xindex + 1, yindex - 1) = 1 THEN CIRCLE (x3 + 30, y3 - 30), 15, 15: board(xindex + 1, yindex - 1) = 2
   IF xindex > 1 AND yindex < 13 THEN IF board(xindex - 1, yindex + 1) = 1 THEN CIRCLE (x3 - 30, y3 + 30), 15, 15: board(xindex - 1, yindex + 1) = 2
  END IF
 
   LOCATE 22, 55: COLOR 4: PRINT "Player 1:"; Score1
   LOCATE 23, 55: COLOR 15: PRINT "Player 2:"; Score2

   IF win <> 0 THEN EXIT DO

First = 0
LOOP UNTIL Occupied = 0 OR Push$ = "Q"
  LOOP UNTIL UCASE$(Push$) = "Q"


END SUB

SUB Intro
   RANDOMIZE TIMER
   FOR Index = 1 TO 5           'Colored lines in background
      FOR iman = 1 TO 10
        COLOR iman: LINE STEP(x150!, x130!)-(300, 200)
        X = INT(720 * RND + 0)
        Y = INT(720 * RND + 0)
        C = INT(75 * RND + 1)
        PSET (X, Y), C
      NEXT iman
   NEXT Index
  
  
   FOR Index = 1 TO 600         'colored dots in background
      num = INT(1 + 455 * RND)
      num2 = INT(1 + 15 * RND)
      num3 = INT(1 + 640 * RND)
      LINE (num3, num)-(num3, num), num2
   NEXT Index
 
END SUB

SUB Menu (Current, Slow)
   Current = 1                  'the current cursor position
         
   FOR jax = 1 TO 30            'Dots in background
      FOR i% = 1 TO 15
        COLOR i%
        X = INT(720 * RND + 0)
        Y = INT(720 * RND + 0)
        C = INT(75 * RND + 1)
        PSET (X, Y), C
      NEXT i%
   NEXT jax
 
  DO
   IF Current > 3 THEN Current = 3
   IF Current < 1 THEN Current = 1
   COLOR 8: LOCATE 11, 20: PRINT ". Play Game . "
   COLOR 8: LOCATE 14, 20: PRINT ".   Rules   . "
   COLOR 8: LOCATE 17, 20: PRINT ". End Game  . "
   DO
      Locat = INT(RND + 20 * 1): Locat2 = INT(8 + 30 * RND)
      Locat3 = INT(RND + 8 * 1): Locat4 = INT(9 + 30 * RND)
      Locat5 = INT(9 + 11 * RND): locat6 = INT(RND + 10 * 1)
      COLOR 7: LOCATE Locat5, 9: PRINT "ì": FOR Index = 1 TO Slow: NEXT Index
      COLOR 7: LOCATE Locat5 + 1, 9: PRINT "": FOR Index = 1 TO Slow: NEXT Index
      COLOR 7: LOCATE Locat5, 42: PRINT "": FOR Index = 1 TO Slow: NEXT Index
      COLOR 7: LOCATE Locat5 + 1, 42: PRINT "ì": FOR Index = 1 TO Slow: NEXT Index
      COLOR 7: LOCATE Locat3, Locat4: PRINT "*ì"
      COLOR 7: LOCATE Locat, Locat2: PRINT "ìì"
                                                
      IF Current = 1 THEN
         COLOR 9: LOCATE 11, 20: PRINT ".  Play Game. "
         LOCATE 11, 45: PRINT "- Play the Game -"
         LOCATE 14, 45: PRINT "                                 "
      END IF
      IF Current = 2 THEN
         COLOR 9: LOCATE 14, 20: PRINT ".    Rules  . "
         LOCATE 14, 45: PRINT "- Rules and object to the game -"
         LOCATE 11, 45: PRINT "                                 "
         LOCATE 17, 45: PRINT "                                 "
      END IF
      IF Current = 3 THEN
         COLOR 9: LOCATE 17, 20: PRINT ".  End Game . "
         LOCATE 17, 45: PRINT "- Quits and ends Program -"
         LOCATE 14, 45: PRINT "                                 "
      END IF
  
   Push$ = INKEY$
   LOOP UNTIL Push$ <> ""
   
   IF Push$ = CHR$(0) + "P" THEN Current = Current + 1              'down
   IF Push$ = CHR$(0) + "H" THEN Current = Current - 1              'up
  LOOP UNTIL Push$ = CHR$(13)

END SUB

SUB Preseter (board())
   CIRCLE (202, 173), 15, 15: board(7, 6) = 2   'pre-sets positions for
   CIRCLE (172, 203), 15, 15: board(6, 7) = 2   'player 1 and 2
   CIRCLE (172, 173), 15, 9: board(6, 6) = 1
   CIRCLE (202, 203), 15, 9: board(7, 7) = 1
END SUB

SUB Rules
   'displays all the rules in appropriate places
   COLOR 15: LOCATE 6, 7: PRINT "The Object of the Game:"
   COLOR 7: LOCATE 7, 6: PRINT "The Object is to get as many of your color pieces as possibal."
   LOCATE 8, 6: PRINT "You must put your color piece(Blue or White) next to as many of"
   LOCATE 9, 6: PRINT "the opposite color as you can. i.e.: You would want to put a": CIRCLE (535, 135), 10, 9: CIRCLE (535, 135), 5, 14
   LOCATE 10, 6: PRINT "next to a": CIRCLE (130, 155), 15, 15: LOCATE 10, 20: PRINT "Piece. So, in turn the White piece turns into a"
   CIRCLE (55, 175), 15, 9: LOCATE 12, 10: PRINT "Peice.  To Win, fill the board with all your color or if your"
   LOCATE 13, 6: PRINT "opponent has no more of his own color left."
   COLOR 15: LOCATE 14, 7: PRINT "Remeber:"
   COLOR 7: LOCATE 15, 6: PRINT "If a piece is touching YOUR piece in any way(left, right,"
   LOCATE 16, 6: PRINT "up, down, or diagnals) the piece will then become you piece."
   COLOR 14: LOCATE 18, 20: PRINT "press a key to continue..."
   COLOR 15: LOCATE 21, 17: PRINT "Rules:"
   COLOR 7: LOCATE 22, 16: PRINT "The Rules are realativly easy...  You can't do"
   LOCATE 23, 16: PRINT "anything the game won't let you do.  If it allows"
   LOCATE 24, 16: PRINT "you to do it, go ahead and do it :)"
  
   DO                           'loops until a key is pressed
   LOOP UNTIL INKEY$ <> ""

END SUB

SUB Win1

   SCREEN 13                    'Prints all the little boxes in random places
   DIM box1%(1 TO 300)          'on the screen
   x1% = 0: x2% = 10: y1% = 0: y2% = 10
   LINE (x1%, y1%)-(x2%, y2%), 9, BF
   GET (x1%, y1%)-(x2%, y2%), box1%
   Colr = 1                     'sets the fading start place
   DO
      PUT (x1%, y1%), box1%, XOR
      x1% = RND * 300
      y1% = RND * 180
      Colr = Colr + 1           'incraments the fading to get brighter
      IF Colr = 30 THEN Colr = 1
      PALETTE 0, Colr: LOCATE 13, 13: COLOR Colr: PRINT "Player 1 WINS!!"
   LOOP WHILE INKEY$ = ""


END SUB

SUB Win2

   SCREEN 13
   DIM box1%(1 TO 300)
   x1% = 0: x2% = 10: y1% = 0: y2% = 10
   LINE (x1%, y1%)-(x2%, y2%), 15, BF
   GET (x1%, y1%)-(x2%, y2%), box1%
   Colr = 1
   DO
      PUT (x1%, y1%), box1%, XOR
      x1% = RND * 300
      y1% = RND * 180
      Colr = Colr + 1
      IF Colr = 30 THEN Colr = 1
      PALETTE 0, Colr: LOCATE 13, 13: COLOR Colr: PRINT "Player 2 WINS!!"
   LOOP WHILE INKEY$ = ""

END SUB