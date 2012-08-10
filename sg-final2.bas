DECLARE SUB Note ()
DECLARE SUB Tracker ()
DECLARE SUB Intro ()
DECLARE SUB Box (Col!, Row!, Size!, Size2!, Pink!)
'Sean Gravener
'The Box:
'Col = The Colom to start the top left corner
'Row = The Row to start the top left corner
'Size = The Size of the Coloms
'Size2 = The Size of the Rows
'Pink = The color of the box

CLS
CALL Box(10, 25, 3, 30, 14)
CALL Intro
DO
LOOP UNTIL INKEY$ <> ""

CLS
CALL Box(1, 1, 1, 76, 15)
CALL Box(4, 1, 4, 36, 15)
CALL Box(4, 41, 4, 36, 15)

'Rows
CALL Box(10, 1, 12, 10, 3)
CALL Box(10, 12, 12, 10, 3)
CALL Box(10, 23, 12, 10, 3)
CALL Box(10, 34, 12, 10, 3)
CALL Box(10, 45, 12, 10, 3)
CALL Box(10, 56, 12, 10, 3)
CALL Box(10, 67, 12, 10, 3)
CALL Tracker

CALL Note

SUB Box (Col, Row, Size, Size2, Pink)
   COLOR Pink
   LOCATE Col, Row: PRINT "É"
   col2 = Col
   FOR index = 1 TO Size
      col2 = col2 + 1
      LOCATE col2, Row: PRINT "º"
      LOCATE col2, Row + Size2: PRINT "º" '+ 21
   NEXT index

   LOCATE col2 + 1, Row: PRINT "È"
   row2 = Row
   FOR index = 1 TO Size2 '+ 21
      row2 = row2 + 1
      LOCATE Col, row2: PRINT "Í"
      LOCATE Col + Size + 1, row2: PRINT "Í"
   NEXT index

   LOCATE Col, row2: PRINT "»"
   LOCATE col2 + 1, row2: PRINT "¼"

END SUB

SUB Intro
   COLOR 9: LOCATE 12, 29: PRINT ".S."; : COLOR 10: PRINT "O."; : COLOR 11: PRINT "U."; : COLOR 12: PRINT "N."; : COLOR 13: PRINT "D"; : COLOR 14: PRINT ".T."; : COLOR 15: PRINT "R."; : COLOR 8: PRINT "A."; : COLOR 7: PRINT "C."; : COLOR 6: PRINT  _
"K."; : COLOR 5: PRINT "R."
END SUB

SUB Note
   octave = 1
   sharp = 0
   x = 11
   y = 2
   DO
      DO
         Key$ = INKEY$
      LOOP UNTIL Key$ <> ""
      IF Key$ = "-" THEN octave = octave - 1: IF Key$ = "+" THEN octave = octave + 1
      IF octave < 0 THEN octave = 0: IF octave > 6 THEN octave = 6
      IF Key$ = "1" THEN sharp$ = "+"
      IF Key$ = "2" THEN sharp$ = "-"
      IF Key$ = "3" THEN sharp$ = " "
      IF UCASE$(Key$) = "A" OR UCASE$(Key$) = "B" OR UCASE$(Key$) = "C" OR UCASE$(Key$) = "D" OR UCASE$(Key$) = "E" OR UCASE$(Key$) = "F" OR UCASE$(Key$) = "G" THEN PLAY "o3" + Key$ + sharp$
      'PRINT octave
      IF UCASE$(Key$) = "A" OR UCASE$(Key$) = "B" OR UCASE$(Key$) = "C" OR UCASE$(Key$) = "D" OR UCASE$(Key$) = "E" OR UCASE$(Key$) = "F" OR UCASE$(Key$) = "G" THEN LOCATE x, y: PRINT Key$; sharp$; octave; "*"
      IF x > 21 THEN x = 10: y = y + 11
      x = x + 1
   LOOP UNTIL Key$ = " "
END SUB

SUB Tracker
   LOCATE 2, 3: PRINT "SoundTracker 1.1", "(C) Sean Gravener", "            1 9 9 8"
   'Rows
   x = 11: y = 2
   COLOR 14: LOCATE 10, 2: PRINT "Row 1"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index
  
   x = 11: y = 13
   COLOR 14: LOCATE 10, 13: PRINT "Row 2"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index

   x = 11: y = 24
   COLOR 14: LOCATE 10, 24: PRINT "Row 3"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index
  
   x = 11: y = 35
   COLOR 14: LOCATE 10, 35: PRINT "Row 4"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index

   x = 11: y = 46
   COLOR 14: LOCATE 10, 46: PRINT "Row 5"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index

   x = 11: y = 57
   COLOR 14: LOCATE 10, 57: PRINT "Row 6"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index

   x = 11: y = 68
   COLOR 14: LOCATE 10, 68: PRINT "Row 7"
   FOR index = 1 TO 12
      COLOR 15: LOCATE x, y: PRINT "... .. ."
      x = x + 1
   NEXT index

END SUB

