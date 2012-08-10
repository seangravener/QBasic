DECLARE SUB GetSalary ()
DECLARE SUB menu ()
DECLARE SUB GetInfo ()
DECLARE SUB Intro ()
'Sean Gravener  per. 3  1/30/98
'This will let the user find there diffrent sallarys and view them in
'diffrent ways.
'File name: SALLY.BAS

SCREEN 0
OPTION BASE 1          'Sets the array to start at 1 instead of 0
DIM month$(12)
DIM mnth(12) AS INTEGER


Intro
GetInfo
GetSalary

DO
   menu
LOOP UNTIL choice$ = "5"

'sets the data for month$ array
DATA "September   ", "November    ", "December    ", "October    ", "March    ", "April    ", "May       ", "June      ", "July      ", "August    ", "January    ", "February     "
END


RETURN


ViewSalary: 'Shows the salary for a spacific month
CLS : SCREEN 0
FOR kewl = 1 TO 12
   PRINT kewl; month$(kewl)
NEXT kewl
PRINT "Please pick a mumber shown....."
DO  'waits untill a valid choice is chosen
  choice$ = INKEY$
LOOP UNTIL choice$ = "12" OR choice$ = "11" OR choice$ = "10" OR choice$ = "9" OR choice$ = "8" OR choice$ = "7" OR choice$ = "6" OR choice$ = "5" OR choice$ = "4" OR choice$ = "3" OR choice$ = "2" OR choice$ = "1"
  PRINT "You have chosen "; choice$; "...is this correct?(Y/N)"
DO 'Checks to make sure the user has chosen the choice they prefer
  pick$ = INKEY$
LOOP UNTIL UCASE$(pick$) = "Y" OR UCASE$(pick$) = "N"
  IF UCASE$(pick$) = "N" THEN GOSUB ViewSalary

'Prints the selected month and salary for that month
num = VAL(choice$)  'Changes the String choice$ to a variable expression
  PRINT "ษอออออออออออออออออออออออออออออออออออออป"
  PRINT "บ Month:"; month$(num); "Salary: "; mnth(num)
  PRINT "ศอออออออออออออออออออออออออออออออออออออผ"
  PRINT "Space to continue..."
DO  'Waits for the spacebar to be pressed
LOOP UNTIL INKEY$ = " "
RETURN

ViewAll:
CLS : SCREEN 0
PRINT "Month:", "Salary:"
 FOR all = 1 TO 12
  PRINT month$(all), mnth(all) 'prints all the months and the salary's for that month
 NEXT all
 PRINT "Space to continue..."
DO  'Waits for the spacebar to be pressed
LOOP UNTIL INKEY$ = " "
RETURN

FindTotal: 'Adds the array and displays the sum
CLS : SCREEN 0
  PRINT "Your total Salary for this year is: "
FOR total = 1 TO 11
  PRINT mnth(total)
  sum = mnth(1) + mnth(2) + mnth(3) + mnth(4) + mnth(5) + mnth(6) + mnth(7) + mnth(8) + mnth(9) + mnth(10) + mnth(11) + mnth(12)
NEXT total
  PRINT "+ "; mnth(12)  'Puts a little plus sign for effect :)
  PRINT "-----------"
  PRINT sum
 PRINT "Space to continue..."
DO  'Waits for the spacebar to be pressed
LOOP UNTIL INKEY$ = " "
RETURN

SUB GetInfo
   FOR m = 1 TO 12        'Read months to an array
      READ month$(m)
   NEXT
END SUB

SUB GetSalary
  'Gets the salary for the months and puts them into an array
   CLS
   SCREEN 2  'The swiches between screen modes to re-intinalize the text mode
   SCREEN 0  'Screen.
   FOR count = 1 TO 12
     LOCATE 15, 15: PRINT "What is you sallary for the month of "; month$(count)
     LOCATE 16, 15: PRINT "                                      "
     LOCATE 16, 15: INPUT "Sallary...:", mnth(kewl)
   NEXT count

END SUB

SUB Intro
   CLS
   SCREEN 13
   FOR i% = 1 TO 30
      PALETTE 15, i%
      LOCATE 15, 10: PRINT "..Salary Program.."
   NEXT i%

   FOR i% = 30 TO 1 STEP -1
      PALETTE 15, i%
      LOCATE 15, 10: PRINT "..Salary Program.."
   NEXT i%

   FOR i% = 1 TO 30
      PALETTE 15, i%
      LOCATE 15, 10: PRINT "By Sean Gravener"
   NEXT i%

   FOR i% = 30 TO 1 STEP -1
      PALETTE 15, i%
      LOCATE 15, 10: PRINT "By Sean Gravener"
   NEXT i%

END SUB

SUB menu
 'The sub for the menu system
CLS
SCREEN 12

  LOCATE 9, 15: PRINT "..SALARY MENU.."
  COLOR 14: LOCATE 10, 10: PRINT "ษออออออออออออออออออออออออออออออป" ' prints the bars ar\ound the menu
  COLOR 15: LOCATE 11, 11: PRINT "1) View a Months Salary"
    LOCATE 12, 11: PRINT "2) Change a Months Salary "
    LOCATE 13, 11: PRINT "3) View ALL Months at once"
    LOCATE 14, 11: PRINT "4) Find Total Salary for year"
    LOCATE 15, 11: PRINT "5) Exit the program"
  COLOR 14: LOCATE 11, 10: PRINT "บ"
  LOCATE 12, 10: PRINT "บ": LOCATE 11, 41: PRINT "บ"
  LOCATE 13, 10: PRINT "บ": LOCATE 12, 41: PRINT "บ"
  LOCATE 14, 10: PRINT "บ": LOCATE 13, 41: PRINT "บ"
  LOCATE 15, 10: PRINT "บ": LOCATE 14, 41: PRINT "บ"
  LOCATE 16, 10: COLOR 14: PRINT "ศออออออออออออออออออออออออออออออผ": LOCATE 15, 41: PRINT "บ"

LOCATE 20, 20: PRINT "Please Select a # shown... "

DO  'waits untill a valid choice is chosen
  choice$ = INKEY$
LOOP UNTIL choice$ = "5" OR choice$ = "4" OR choice$ = "3" OR choice$ = "2" OR choice$ = "1"
  PRINT "You have chosen "; choice$; "...is this correct?(Y/N)"

DO 'Checks to make sure the user has chosen the choice they prefer
  pick$ = INKEY$
LOOP UNTIL UCASE$(pick$) = "Y" OR UCASE$(pick$) = "N"
  IF UCASE$(pick$) = "N" THEN GOSUB menu

END SUB

SUB validate
'Tell the program where to go according to the number picked
  IF choice$ = "1" THEN GOSUB ViewSalary
  IF choice$ = "2" THEN GOSUB GetSalary
  IF choice$ = "3" THEN GOSUB ViewAll
  IF choice$ = "4" THEN GOSUB FindTotal
  IF choice$ = "5" THEN END

END SUB

