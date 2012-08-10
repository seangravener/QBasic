DECLARE SUB ToFile ()
DECLARE SUB ToTheScreen ()
DECLARE SUB Selection (Back, TFore, Fore, TBack)
DECLARE SUB Heading ()
DECLARE SUB GetChoice ()
DECLARE SUB Box (Col!, Row!, Size!, Size2, Pink)
DECLARE SUB Welcome ()
'Sean Gravener
'DOS Color Customizer

CLS
CALL Box(10, 20, 2, 2, 3)
CALL Welcome
CLS

'[DrawBoxes]
CALL Box(2, 2, 20, 55, 3)
CALL Box(4, 9, 2, 40, 3)
CALL Heading
CALL Box(9, 4, 2, 2, 14)
CALL Box(9, 53, 2, 2, 14)
CALL Box(15, 4, 2, 2, 14)
CALL Box(15, 53, 2, 2, 14)
CALL Box(19, 3, 1, 42, 7)
CALL ToTheScreen
CALL Selection(Back, TFore, Fore, TBack)
CALL ToFile

SUB Box (Col, Row, Size, Size2, Pink)
   COLOR Pink
   LOCATE Col, Row: PRINT "É"
   col2 = Col
   FOR index = 1 TO Size
      col2 = col2 + 1
      LOCATE col2, Row: PRINT "º"
      LOCATE col2, Row + Size2 + 21: PRINT "º"
   NEXT index
  
   LOCATE col2 + 1, Row: PRINT "È"
   row2 = Row
   FOR index = 1 TO Size2 + 21
      row2 = row2 + 1
      LOCATE Col, row2: PRINT "Í"
      LOCATE Col + Size + 1, row2: PRINT "Í"
   NEXT index

   LOCATE Col, row2: PRINT "»"
   LOCATE col2 + 1, row2: PRINT "¼"
END SUB

SUB GetChoice
  
END SUB

SUB Heading
   COLOR 15: LOCATE 5, 25: PRINT "[The DOS Color Costomizer]"
   COLOR 15: LOCATE 6, 25: PRINT "(C) Sean Gravener  -  1998 "
END SUB

SUB Selection (Back, TFore, Fore, TBack)
   COLOR 15: LOCATE 20, 5: PRINT "Please Select a color for the Background color"
   COLOR 3: LOCATE 11, 7: INPUT "Color #:", Back
   COLOR 15: LOCATE 20, 5: PRINT "Please Select a color for the Text color"
   COLOR 3: LOCATE 17, 7: INPUT "Color #:", TFore
   COLOR 15: LOCATE 20, 5: PRINT "Please Select a color for the Foreground color"
   COLOR 3: LOCATE 11, 58: INPUT "Color #:", Fore
   COLOR 15: LOCATE 20, 5: PRINT "Please Select a color for the Text Background color"
   COLOR 3: LOCATE 17, 58: INPUT "Color #:", TBack
END SUB

SUB ToFile
   TIMER ON
   ok = 0
   OPEN "c:\autoexec.bat" FOR APPEND AS #1
   'SHELL "copy c:\autoexec.bat c:\autoexec.002"
   'SHELL "copy c:\config.sys c:\autoexec.002"
   COLOR 15: LOCATE 20, 5: PRINT "C:\AUTOEXEC.BAT / CONFIG.SYS to C:\AUTOEXEC.002 / CONFIG.002"
   SLEEP
   TheEnd = LOF(1)
   SEEK #1, TheEnd
   PRINT #1, "PROMPT $p$g"
   CLOSE #1
   OPEN "c:\config.sys" FOR APPEND AS #1
   PRINT #1, "devicehigh=c:\dos\ansi.sys"
   CLOSE #1
END SUB

SUB ToTheScreen
   COLOR 15: LOCATE 10, 7: PRINT "BackGround Color"
   COLOR 15: LOCATE 16, 7: PRINT "ForeGround Color"
   COLOR 15: LOCATE 10, 58: PRINT "Text BackGround"
   COLOR 15: LOCATE 16, 58: PRINT "Text ForeGround"
   COLOR 15: LOCATE 8, 30: PRINT "- Text -    - BackGround -"
   COLOR 4: LOCATE 9, 33: PRINT "31 - Red     - 41"
   COLOR 2: LOCATE 10, 33: PRINT "32 - Green   - 42"
   COLOR 5: LOCATE 11, 33: PRINT "33 - Magenta - 43"
   COLOR 9: LOCATE 12, 33: PRINT "34 - Blue    - 44"
   COLOR 1: LOCATE 13, 33: PRINT "35 - Brown   - 45"
   COLOR 3: LOCATE 14, 33: PRINT "36 - Cyan    - 46"
   COLOR 15: LOCATE 15, 33: PRINT "37 - White   - 47"
   COLOR 8: LOCATE 16, 33: PRINT "30 - Black   - 40"
END SUB

SUB Welcome
   COLOR 14
   LOCATE 11, 21: PRINT " Welcome To the DOS   "
   LOCATE 12, 21: PRINT " Color Costomizer!!   "
   SLEEP 2
END SUB

