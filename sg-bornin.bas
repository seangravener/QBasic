'Sean Gravener - Period 3 - 3//98
'This program will find the day you were born on. You need to enter the Year
'Day, and month you were born on.  The program uses an alogorythm to find
'The day.
'File Name: BORNIN.BAS

DECLARE SUB Display (Dayy AS STRING)
DECLARE FUNCTION Days! (Step3 AS INTEGER, Dayy AS STRING)
DECLARE FUNCTION Leap! (Step2 AS INTEGER)
DECLARE SUB Get.Birthday (Month AS INTEGER, day AS INTEGER, Year AS INTEGER, pname AS STRING)
DECLARE FUNCTION FindWk2! (Month AS INTEGER, Step1 AS INTEGER)
DECLARE FUNCTION FindWk! (Year AS INTEGER, day AS INTEGER)

CLS
DIM pname AS STRING     'The Name of the person
DIM Month AS INTEGER    'The Month he/she was born
DIM day AS INTEGER      'The Day he/she was born
DIM Year AS INTEGER     'The Year he/she was born
DIM Step1 AS INTEGER    'The Variable for a funtion(steps 1-3)
DIM Step2 AS INTEGER    'The Variable for a funtion(step 4)

CALL Get.Birthday(Month%, day%, Year%, pname$) 'Passing by Reference.
Step1 = FindWk((Year%), (day%))                'Passing by Value.
Step2 = FindWk2((Month%), Step1)
Step2 = Leap(Step2)
Step2 = Days(Step2, Dayy$)
CALL Display((Dayy$))                          'Passing by Value

END
 
         

FUNCTION Days (Step2 AS INTEGER, Dayy AS STRING)
   DIM TheDay AS INTEGER
   TheDay = Step2 MOD 7
   'A select case for the remainder of the total divided by 7.
   SELECT CASE TheDay
      CASE 1
         Dayy = "Sunday"
      CASE 2
         Dayy = "Monday"
      CASE 3
         Dayy = "Tuesday"
      CASE 4
         Dayy = "Wednesday"
      CASE 5
         Dayy = "Thrusday"
      CASE 6
         Dayy = "Friday"
      CASE 0
        Dayy = "Saturday"
   END SELECT
END FUNCTION

SUB Display (Dayy AS STRING)
   'displays the day the person was born.
   PRINT "You were born on a "; Dayy
END SUB

FUNCTION FindWk (Year AS INTEGER, day AS INTEGER)
   DIM totaling AS INTEGER
   totaling = Year \ 4          'Divides the year by 4
   totaling = Year + totaling   'Adds the year divided by 4 plus the year
   totaling = totaling + day    'Adds the current total plus the day
   FindWk = totaling            'Sets the total to the function
END FUNCTION

FUNCTION FindWk2 (Month AS INTEGER, Step1 AS INTEGER)
   'Depending on the month(1-12), it will add x amount to the current total.
   SELECT CASE Month
      CASE 1
         Step1 = Step1 + 1
      CASE 2
         Step1 = Step1 + 4
      CASE 3
         Step1 = Step1 + 4
      CASE 4
         Step1 = Step1 + 0
      CASE 5
         Step1 = Step1 + 2
      CASE 6
         Step1 = Step1 + 5
      CASE 7
         Step1 = Step1 + 0
      CASE 8
         Step1 = Step1 + 3
      CASE 9
         Step1 = Step1 + 6
      CASE 10
         Step1 = Step1 + 1
      CASE 11
         Step1 = Step1 + 4
      CASE 12
         Step1 = Step1 + 6
   END SELECT
   FindWk2 = Step1
END FUNCTION

SUB Get.Birthday (Month AS INTEGER, day AS INTEGER, Year AS INTEGER, pname AS STRING)
 'This sub is only for getting the input from the user.  It askes the users
 'name month,day and Year on which they were born.

 DO
   CLS
   INPUT "Please enter your name: ", pname$
   DO
      INPUT "Please enter the month you were born(1-12): ", Month
      IF Month > 12 THEN PRINT "...1-12 please"
   LOOP UNTIL Month > 0 AND Month < 13
   DO
      INPUT "Please enter the day you were born on(1-32): ", day
      IF day > 31 THEN PRINT "...1-31 please"
   LOOP UNTIL day > 0 AND day < 32
   DO
      INPUT "Please enter the year you were born on(00-99): ", Year
      IF Year > 99 THEN PRINT "x-99 please"
   LOOP UNTIL Year < 99 AND Year > 0
   PRINT "   Name : "; pname$
   PRINT "   Month: "; Month
   PRINT "   Day  : "; day
   PRINT "   Year : "; Year
   PRINT "Is this information correct(Y/N)?"
   DO
      key$ = INKEY$
   LOOP UNTIL UCASE$(key$) = "N" OR UCASE$(key$) = "Y"
 LOOP UNTIL UCASE$(key$) = "Y"
END SUB

FUNCTION Leap (Step2 AS INTEGER)
   'This function descides if the year was a leap year or not
   'and if so, it subtracts 1 from the current total.
   IF Step2 MOD 4 = 0 THEN Step2 = Step2 - 1
   Leap = Step2
END FUNCTION

