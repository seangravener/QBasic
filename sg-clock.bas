'Sean Gravener 1998
'Clock in 12 hr format
'This is a simple example of using the internal qbasic TIME$ function
'but using it in a 12 hr format instead of 24 hr.  As the hour changes
'so does the color.

DECLARE SUB Box ()      'a sub

CLS             'Clears the screen
SCREEN 13       'Puts the screen mode to 320 x 200 with 256k colors :)
CALL Box        'A Sub(F2) that draws the box the time is in
DO              'The beggining of the DO/LOOP
   hour = VAL(LEFT$(TIME$, 2))  'changes the Function TIME$ String to a
                                'numeric value
      IF hour >= 12 THEN p$ = "am" ELSE p$ = "pm"
      IF hour > 12 THEN hour = hour - 12
      IF hour = 0 THEN hour = 12
      hour$ = STR$(hour)
   minute$ = MID$(TIME$, 4, 2)
   Now$ = hour$ + ":" + minute$ + " " + p$
   COLOR hour: LOCATE 12, 15: PRINT Now$
LOOP UNTIL INKEY$ <> "" 'The end of the DO/LOOP(loops until the keyboard isen't
                        'returning a null


SUB Box
   LOCATE 11, 14: PRINT "ษอออออออออป"
   LOCATE 12, 14: PRINT "บ         บ"
   LOCATE 13, 14: PRINT "ศอออออออออผ"
END SUB

