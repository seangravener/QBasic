CLS
OPEN "a:\test.dat" FOR INPUT AS #1

DIM studentname AS STRING
DIM class AS INTEGER

COLOR 15: PRINT "BISII sprint 98"
PRINT
COLOR 10: PRINT "Name"; TAB(30); "Grade"
COLOR 8: PRINT "¯¯¯¯"; TAB(30); "¯¯¯¯¯"

PRINT

DO
   INPUT #1, studentname, class
   COLOR 9: PRINT studentname, TAB(30); class
LOOP UNTIL EOF(1)

CLOSE #1

END



