DECLARE SUB Stars ()
DECLARE SUB Dividingline (x!, y!)
DECLARE SUB center (s AS STRING)
CLS
PRINT "Sean"
Dividingline 2, 1
PRINT "Qbasic"
Stars
center "HI"
END


SUB center (s AS STRING)
   PRINT TAB(40 - LEN(s$) / 2); s$

END SUB

SUB Dividingline (x, y)
  
   PRINT
  LOCATE x, y: PRINT "------------------------"
   PRINT

END SUB

SUB Stars
  
   PRINT "*****************************************"

END SUB

