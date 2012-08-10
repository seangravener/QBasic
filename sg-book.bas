'Sean Gravener - period 3 - 4/2/98
'This program is a address book.  It stores addresses of people and other
'misc. infomation.  It  uses GET and PUT to write the infomation to a
'RANDOM file. You may add as many records as you like.  You may delete
'a record or change a record.  It also sorts the names by last name.
'File Name: BOOK.BAS


DECLARE SUB Sort (Record AS ANY)        'This Sorts the last names a ABC order
DECLARE SUB Change (Record AS ANY)      'You may change a record
DECLARE SUB KillRecord ()               'You may delete the ENTIRE record
DECLARE SUB VeiwBday (Record AS ANY)    'You may view everyone's Birthday
DECLARE SUB Rid (Record AS ANY)         'You may delete a record
DECLARE SUB ViewBook (Record AS ANY)    'You may View a persons Record
DECLARE SUB Menu (Choice AS INTEGER)              'Choose what you would like to do
DECLARE SUB New (Record AS ANY)  'You may Create a new record

CLS

TYPE Info                               'The type used to store the person's
   Lname AS STRING * 15                 'Records
   First AS STRING * 15
   Address AS STRING * 40
   Phone AS STRING * 15
   Email AS STRING * 30
   Bday AS STRING * 15
END TYPE

DIM Record AS Info                      'The defined type
DIM Choice AS INTEGER

DO                                      'This loop keeps repeating until
   CALL Menu(Choice)                     'the person chooses choice 6
   IF Choice = 1 THEN CALL New(Record)
   IF Choice = 2 THEN CALL Sort(Record): CALL Rid(Record)
   IF Choice = 3 THEN CALL Sort(Record): CALL ViewBook(Record)
   IF Choice = 4 THEN CALL Sort(Record): CALL VeiwBday(Record)
   IF Choice = 5 THEN CALL Sort(Record): CALL Change(Record)
   IF Choice = 7 THEN KillRecord
LOOP UNTIL Choice = 6

END                                     'Ends the program :)

SUB Change (Record AS Info)
   DIM Num AS INTEGER
   DIM Done AS INTEGER
   DIM InDeX AS INTEGER
   CLS
  DO
   Done = 1                     'This is so that the loop never executes
   PRINT "Change a Record"
   OPEN "A:\BOOK.DAT" FOR RANDOM AS #1 LEN = LEN(Record)
   FOR InDeX = 1 TO LOF(1) / LEN(Record)        'the number of records in file
      GET #1, InDeX, Record
      PRINT InDeX; ":"; Record.Lname; Record.First
   NEXT InDeX
   PRINT InDeX; ": - Cancel -"
   INPUT "Please Enter the person's record number: ", Num
   IF Num = InDeX THEN EXIT DO                  'Jumps out if the coose to cancel
   LOCATE 15, 10: INPUT "Please enter The persons LAST name: ", Record.Lname
   LOCATE 16, 10: INPUT "Please enter the persons First Name: ", Record.First
   LOCATE 17, 10: INPUT "Please enter the persons Address: ", Record.Address
   LOCATE 18, 10: INPUT "Please enter the persons Phone #: ", Record.Phone
   LOCATE 19, 10: INPUT "Please enter the persons E-Mail: ", Record.Email
   LOCATE 20, 10: INPUT "Please enter the persons Birthday :", Record.Bday
   PUT #1, Num, Record
  LOOP UNTIL Done = 1
   CLOSE #1
END SUB

SUB KillRecord
   DIM pick AS STRING
   CLS
   COLOR 30: LOCATE 4, 3: PRINT "WARNING!!"
   COLOR 3: LOCATE 5, 5: PRINT "You are about to delete your ENTIRE ADDRESS BOOK RECORD"
   LOCATE 6, 5: PRINT "Are you SURE you want to continue(Y / N)?"
   DO
      pick$ = INKEY$
   LOOP UNTIL UCASE$(pick$) = "Y" OR UCASE$(pick$) = "N"
   IF UCASE$(pick$) = "Y" THEN
      KILL "a:\book.dat"
      PRINT "File Deleted!!"
      SLEEP 2
   END IF
END SUB

SUB Menu (Choice AS INTEGER)
   CLS
   COLOR 15:
   LOCATE 10, 20: PRINT "ADRESS MENU"
   LOCATE 15, 10: PRINT "1. Add a person"
   LOCATE 16, 10: PRINT "2. Remove a person"
   LOCATE 17, 10: PRINT "3. View a person's info"
   LOCATE 18, 10: PRINT "4. View all BDays"
   LOCATE 19, 10: PRINT "5. Change a Record"
   LOCATE 20, 10: PRINT "6. Exit"
   LOCATE 21, 10: PRINT "7. Delete ENTIRE Record"
   LOCATE 22, 15: INPUT "1 - 7: ", Choice
END SUB

SUB New (Record AS Info)
   DIM Pick1 AS STRING
   OPEN "a:\book.dat" FOR RANDOM AS #1 LEN = LEN(Record)
   DO
      CLS : SCREEN 0
      LOCATE 1, 20: PRINT "ADDRESS BOOK ENTRY"
      LOCATE 5, 10: INPUT "Please enter The persons LAST name: ", Record.Lname
      LOCATE 6, 10: INPUT "Please enter the persons First Name: ", Record.First
      LOCATE 7, 10: INPUT "Please enter the persons Address: ", Record.Address
      LOCATE 8, 10: INPUT "Please enter the persons Phone #: ", Record.Phone
      LOCATE 9, 10: INPUT "Please enter the persons E-Mail: ", Record.Email
      LOCATE 10, 10: INPUT "Please enter the persons Birthday :", Record.Bday
      SEEK #1, (LOF(1) / LEN(Record)) + 1
      PUT #1, , Record
      PRINT "Would you like to enter another Person(Y/N)?"
      DO
         Pick1$ = INKEY$
      LOOP UNTIL UCASE$(Pick1$) = "Y" OR UCASE$(Pick1$) = "N"
   LOOP UNTIL UCASE$(Pick1$) = "N"
   PRINT "Writing Infomation to disk...."
   CLOSE #1
END SUB

SUB Rid (Record AS Info)
   CLS
   DIM Null AS STRING
   DIM InDeX AS INTEGER
   DIM Done AS INTEGER
   Null$ = " - Deleted -                                                                                                                  "
   OPEN "A:\BOOK.DAT" FOR RANDOM AS #1 LEN = LEN(Record)
   DO
      Done = 1                  'So the loop never executes
      FOR InDeX = 1 TO LOF(1) / LEN(Record)
         GET #1, InDeX, Record
         PRINT InDeX; ":"; Record.Lname; Record.First
      NEXT InDeX
      PRINT InDeX; ": - Cancel -"
      INPUT "Please Enter the person's record number: ", Num
      IF Num = InDeX THEN EXIT DO
      PUT #1, Num, Null$
   LOOP UNTIL Done = 1
   CLOSE #1
END SUB

SUB Sort (Record AS Info)
   OPEN "a:\book.dat" FOR RANDOM AS #1 LEN = LEN(Record)
   DIM Rec AS INTEGER
   Rec = LOF(1) / LEN(Record)
   DIM Array(Rec) AS Info
   DIM InDeX AS INTEGER
   DIM Final AS INTEGER
   FOR InDeX = 1 TO Rec
      GET #1, InDeX, Record
      Array(InDeX) = Record
   NEXT InDeX
 
   Final = Rec
 
   DO   'Uses the bubble sort to sort the names in ABC order
      FOR InDeX = 1 TO Rec - 1
         IF Array(InDeX).Lname > Array(InDeX + 1).Lname THEN SWAP Array(InDeX), Array(InDeX + 1)
      NEXT InDeX
   Final = Final - 1
   LOOP UNTIL Final = 0
   
   FOR InDeX = 1 TO Rec
      PUT #1, InDeX, Array(InDeX)
   NEXT InDeX
  
   CLOSE #1
END SUB

SUB VeiwBday (Record AS Info)
   CLS
   OPEN "a:\book.dat" FOR RANDOM AS #1 LEN = LEN(Record)
   PRINT "Last Name", "  First Name", "     Birthday"
   FOR InDeX = 1 TO LOF(1) / LEN(Record)
      GET #1, InDeX, Record
      PRINT InDeX; ":"; Record.Lname; Record.First; Record.Bday
   NEXT InDeX
   CLOSE #1
   SLEEP
END SUB

SUB ViewBook (Record AS Info)
   CLS
   DIM Done AS INTEGER
   DIM Num AS INTEGER
   OPEN "a:\book.dat" FOR RANDOM AS #1 LEN = LEN(Record)
   DO
      Done = 1          'So the loop never Executes
      PRINT "View a persons Record"
      FOR InDeX = 1 TO LOF(1) / LEN(Record)
         GET #1, InDeX, Record
         PRINT InDeX; ":"; Record.Lname; Record.First
      NEXT InDeX
      PRINT InDeX; ":- Cancel -"
      INPUT "Please Enter the person's record number: ", Num
      IF Num = InDeX THEN EXIT DO
      GET #1, Num, Record
      PRINT
      PRINT "Last Name:"; Record.Lname
      PRINT "Fist Name:"; Record.First
      PRINT "Address  :"; Record.Address
      PRINT "Phone #  :"; Record.Phone
      PRINT "Email    :"; Record.Email
      PRINT "Birthday :"; Record.Bday
      PRINT "Press any key to continue..."
      SLEEP
   LOOP UNTIL Done = 1
   CLOSE #1
END SUB

