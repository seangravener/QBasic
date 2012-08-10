DECLARE SUB moon ()
DECLARE SUB dog ()
menu:
CLS
SCREEN 0
COLOR 14: PRINT "Please choose what you would like to know..."
COLOR 9: PRINT "1. What you would weigh on the moon"
PRINT "2. What your age would be in dog years"
PRINT "3. Exit this crap"
COLOR 15: INPUT "What do you want to do:", sure$
IF UCASE$(sure$) = "1" THEN moon
IF UCASE$(sure$) = "2" THEN dog
IF UCASE$(sure$) = "3" THEN END
GOTO menu

SUB dog
CLS
INPUT "Please enter your age:", age
PRINT "Your age in dog years would be...."
PRINT age * 7
SLEEP
END SUB

SUB moon
CLS
INPUT "What is your weight now(in lbs.):", now
PRINT "Your weight on the moon would be... "
PRINT now / 6; "lbs."
SLEEP
END SUB

