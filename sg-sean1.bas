'Sean Gravener
'1/26/98
'Programs that were on a sheet

'SUB's
DECLARE SUB stuff ()
DECLARE SUB estuff ()
DECLARE SUB forget ()
SCREEN 0
CLS

'1
'ask's the user to enter the ammount that will be defined as "a"
INPUT "Dollar amount: ", a
'prints the user defined "a" into a x,xxx.xx format
PRINT USING "#,###.##"; a
'pauses
WHILE INKEY$ = " ": WEND

'2
tryagain:
'ask's the user to enter a password to be defined as "fine$"
COLOR 15: PRINT "Enter Password: "
COLOR 0: LOCATE 5, 15: INPUT " ", fine$
'checks if "fine$" is "bob" or not
IF UCASE$(fine$) = "BOB" THEN COLOR 15: PRINT "GOOD JOB!!": WHILE INKEY$ = " ": WEND: GOTO ok
COLOR 15: PRINT "nope"
GOTO tryagain

'3
ok:
'askes the users to select a #
COLOR 15: PRINT "Please select a number..."
'prints the choises the user has
COLOR 14: PRINT "1) just dumb stuff"
PRINT "2) even dumber stuff"
PRINT "3) forget it"
PRINT "4) quit"
COLOR 15: INPUT "Your Selection: ", sel
'does what the user askes to do
IF sel = 1 THEN stuff
IF sel = 2 THEN estuff
IF sel = 3 THEN forget
IF sel = 4 THEN GOSUB ok2
IF sel > 1 THEN GOSUB ok
IF sel < 4 THEN GOSUB ok

'4
ok2:
PRINT " the even #'s of 1 to 21 looks like this..."
FOR a = 2 TO 22 STEP 2
PRINT a
NEXT
SLEEP
CLS

'5 While/wend
PRINT "while/wend"
WHILE x < 21
x = x + 2
PRINT x
WEND
SLEEP

'Do Loop/while
PRINT "Do loop/while"
DO
x = x + 2
PRINT x
LOOP WHILE x = 21
SLEEP

'Do loop/until
PRINT "Loop/Until"
x = 0
DO
x = x + 2
PRINT x
LOOP UNTIL x = 22
SLEEP

'This picks a random # between 0 and 1
RANDOMIZE TIMER
x = INT(100 * RND + 1)
hl:
a = a + 1
PRINT x
INPUT "Please pick a # between 1 and 100: ", num
IF num < x THEN PRINT "Higher": GOTO hl
IF num > x THEN PRINT "Lower": GOTO hl
IF num = x THEN PRINT "You GOT IT!!!... it took you "; a; " times to get it"

'Opening files
10
OPEN "c:\dos\student.dat" FOR OUTPUT AS #1
INPUT "please input your name:", name$
INPUT "please input your Grad:", grade$
INPUT "please input your G.P.A:", gpa$
PRINT #1, "Name:", name$, "Grade:", grade$, "GPA:", gpa$
CLOSE #1
OPEN "student.dat" FOR INPUT AS #1
INPUT #1, junk$
PRINT "The info reads..."
PRINT junk$
SLEEP

CLS
'array
READ a, b, c, d, e, f
PRINT a, b, c, d, e, f
DATA 20,22,45,60,24,16

'

SUB estuff
COLOR 9: PRINT "even dumber stuff"
WHILE INKEY$ = " ": WEND
END SUB

SUB forget
COLOR 9: PRINT "just forget it"
WHILE INKEY$ = " ": WEND
END SUB

SUB stuff
COLOR 9: PRINT "this is stuff"
WHILE INKEY$ = " ": WEND
END SUB

