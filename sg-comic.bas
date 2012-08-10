'Sean Gravener - Period 1 - Comic - 5/30/98
'This a drawing of a comic of a dog in a newspaper.  It uses the line and
'circle statements for all the lines.
'comic.bas

DECLARE SUB Words ()
DECLARE SUB Clouds ()
DECLARE SUB TurnHeadLines ()
DECLARE SUB Face ()

SCREEN 12: CLS

CALL Face               'This draws his head and face attributes.
CALL TurnHeadLines      'This is the "shwooshing" lines showing his head turing
CALL Clouds             'The bubble clouds for speaking
CALL Words              'The words inside the bubble clouds.

END                     'Ends the program

SUB Clouds
   pi = (4 * ATN(1)) / 180
   CIRCLE (300, 10), 200, , , , -200 * pi
   CIRCLE (300, 110), 20, , , , -200 * pi
END SUB

SUB Face
   pi = (4 * ATN(1)) / 180
   'Head
   CIRCLE (274, 305), 91, , .5, 180 * pi
   'Forehead lines
   LINE (270, 215)-(274, 250)
   LINE (280, 215)-(284, 250)
   LINE (224, 251)-(265, 235)
   LINE (224, 261)-(265, 245)
   LINE (324, 251)-(290, 245)
   LINE (324, 241)-(290, 235)
   'right eye
   LINE (321, 348)-(314, 305)
   LINE (315, 350)-(306, 305)
   CIRCLE (310, 305), 3, , .5, 180 * pi
   CIRCLE (318, 350), 3, , 180 * pi, .6
   'left eye
   LINE (281, 348)-(274, 305)
   LINE (275, 350)-(266, 305)
   CIRCLE (270, 305), 3, , .5, 180 * pi
   CIRCLE (278, 350), 3, , 180 * pi, .6
   'snout
   LINE (402, 348)-(340, 355)
   CIRCLE (415, 350), 12, , , 6.2, 50 * pi
   CIRCLE (410, 420), 70, , , 1, 180 * pi
   LINE (431, 420)-(310, 420)
   'ears
   CIRCLE (193, 350), 70, , 2, 4, 180 * pi
END SUB

SUB TurnHeadLines
   pi = (4 * ATN(1)) / 180
   CIRCLE (100, 250), 50, , 1, 5, 40 * pi
   CIRCLE (100, 320), 50, , 3, 5, 40 * pi
END SUB

SUB Words
   LOCATE 2, 25: PRINT "...Leaving me all alone,"
   LOCATE 3, 26: PRINT "miles from anywhere!"
END SUB

