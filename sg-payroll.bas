'***********************************
'*  This program demonstrates the  *
'*  use of records (user-defined   *
'*  types) with sequential files.  *
'***********************************

DECLARE SUB addToPayroll (emp AS ANY)
DECLARE SUB menu (choice AS INTEGER)
DECLARE SUB createPayroll (anEmployee AS ANY)
DECLARE SUB printPayroll (employeeRec AS ANY)

TYPE EMPLOYEE
   lastName AS STRING * 15
   hours AS SINGLE
   hourlyWage AS SINGLE
   overtime AS SINGLE
   grossPay AS SINGLE
END TYPE

DIM worker AS EMPLOYEE
DIM menuChoice AS INTEGER

DO
  CALL menu(menuChoice)
  SELECT CASE menuChoice
    CASE 1
      CALL createPayroll(worker)
    CASE 2
      CALL printPayroll(worker)
    CASE 3
      CALL addToPayroll(worker)
  END SELECT
LOOP UNTIL menuChoice = 4

END

SUB addToPayroll (emp AS EMPLOYEE)
 
  DIM aKey AS STRING
  DIM regPay AS SINGLE
  DIM overPay AS SINGLE
 
  OPEN "A", #1, "a:payroll.dat"

  DO
    CLS
    INPUT "Enter the name of the employee: ", emp.lastName
    INPUT "Enter the number of hours they worked: ", emp.hours
    INPUT "Enter their hourly wage: ", emp.hourlyWage
    IF emp.hours > 40 THEN
      emp.overtime = emp.hours - 40
    ELSE
      emp.overtime = 0
    END IF
    regPay = (emp.hours - emp.overtime) * emp.hourlyWage
    overPay = emp.overtime * (emp.hourlyWage + (emp.hourlyWage / 2))
    emp.grossPay = regPay + overPay
    WRITE #1, emp.lastName, emp.hours, emp.hourlyWage, emp.overtime, emp.grossPay
    PRINT
    PRINT
    PRINT "Press 1 to enter another employee."
    PRINT "Press 2 to return to the main menu."
    PRINT
    PRINT
    DO
      aKey = INKEY$
    LOOP UNTIL aKey = "1" OR aKey = "2"
  LOOP UNTIL aKey = "2"
  PRINT "Please wait ... Data is being sent to the file."
  CLOSE #1

END SUB

SUB createPayroll (anEmployee AS EMPLOYEE)
   
  DIM aKey AS STRING
  DIM regPay AS SINGLE
  DIM overPay AS SINGLE

  OPEN "O", #1, "a:payroll.dat"
 
  DO
    CLS
    INPUT "Enter the name of the employee: ", anEmployee.lastName
    INPUT "Enter the number of hours they worked: ", anEmployee.hours
    INPUT "Enter their hourly wage: ", anEmployee.hourlyWage
    IF anEmployee.hours > 40 THEN
      anEmployee.overtime = anEmployee.hours - 40
    ELSE
      anEmployee.overtime = 0
    END IF
    regPay = (anEmployee.hours - anEmployee.overtime) * anEmployee.hourlyWage
    overPay = anEmployee.overtime * (anEmployee.hourlyWage + (anEmployee.hourlyWage / 2))
    anEmployee.grossPay = regPay + overPay
    WRITE #1, anEmployee.lastName, anEmployee.hours, anEmployee.hourlyWage, anEmployee.overtime, anEmployee.grossPay
    PRINT
    PRINT
    PRINT "Press 1 to enter another employee."
    PRINT "Press 2 to return to the main menu."
    PRINT
    PRINT
    DO
      aKey = INKEY$
    LOOP UNTIL aKey = "1" OR aKey = "2"
  LOOP UNTIL aKey = "2"
  PRINT "Please wait ...  Data is being sent to the file."
  CLOSE #1
END SUB

SUB menu (choice AS INTEGER)
  CLS
  PRINT "Weekly Payroll Report Program"
  PRINT
  PRINT "1.    Create a new weekly payroll report"
  PRINT "2.    Print this week's payroll report"
  PRINT "3.    Add to this week's payroll report"
  PRINT "4.    Exit the payroll program"
  PRINT
  DO
    INPUT "YOUR CHOICE: ", choice
  LOOP UNTIL choice > 0 AND choice < 5
END SUB

SUB printPayroll (employeeRec AS EMPLOYEE)
  CLS
  OPEN "I", #1, "a:payroll.dat"
  PRINT "EMPLOYEE"; SPC(9); "HOURS WORKED"; SPC(4); "HOURLY RATE";
  PRINT SPC(4); "OVERTIME HOURS"; SPC(4); "GROSS PAY"
  PRINT
  DO WHILE NOT (EOF(1))
    INPUT #1, employeeRec.lastName, employeeRec.hours, employeeRec.hourlyWage, employeeRec.overtime, employeeRec.grossPay
    PRINT employeeRec.lastName; TAB(21); employeeRec.hours; TAB(34); USING "$$###.##"; employeeRec.hourlyWage;
    PRINT TAB(54); employeeRec.overtime; TAB(64); USING "$$##,###.##"; employeeRec.grossPay
    PRINT
  LOOP
  PRINT "Press any key to return to the main menu."
  DO
  LOOP UNTIL INKEY$ <> ""
  CLOSE #1
END SUB

