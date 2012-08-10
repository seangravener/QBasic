'Sean Gravener - Period 3 - 3//98 -
'This program uses a user defined type to get dates and cost for certain items
'EXPEND.BAS
'**************************************************************************
' *** !Use EXAMPLE.DAT for an example of things listed(a:\example.dat)! ***
'**************************************************************************
DECLARE SUB PrintOut ()
DECLARE SUB CreateNew (Item AS ANY)
DECLARE SUB UpDateOld (Item AS ANY)
DECLARE SUB Menu (Choice AS INTEGER)

CLS

TYPE Record             'The TYPE record
   Names AS STRING * 20 'The Name of the Item(20 Char. max)
   Cost AS SINGLE       'The Cost of the Item
   Dates AS STRING * 10 'The Date when the Item was purchesed(10 Char. max)
END TYPE

DIM Item AS Record      'The actual item
DIM Choice AS INTEGER   'The Menu choice
DO
   CALL Menu(Choice)
   IF Choice = 1 THEN CALL CreateNew(Item)      'Creates a new record
   IF Choice = 2 THEN CALL UpDateOld(Item)      'Updates an old record
   IF Choice = 3 THEN CALL PrintOut             'Prints a record to the screen
LOOP UNTIL Choice = 4

COLOR 14: PRINT "GoodBye!!"

END

SUB CreateNew (Item AS Record)
   CLS
   DIM Pick AS STRING
   LOCATE 10, 2: INPUT "Please Enter a File Name(C:\DATA.DAT):", Place$
   OPEN Place$ FOR OUTPUT AS #1
   CLS
   Count = 1
   DO
      CLS
      COLOR 15: LOCATE 1, 2: PRINT "Please Enter Date of Product for Expendature #"; Count; ":"
      COLOR 14: LOCATE 2, 5: INPUT "-->", Item.Dates
      COLOR 15: LOCATE 5, 2: PRINT "Please Enter Name of Product for Expendature #"; Count; ":"
      COLOR 14: LOCATE 6, 5: INPUT "-->", Item.Names
      COLOR 15: LOCATE 9, 2: PRINT "Please Enter Cost of Procket for Expendature #"; Count; ":"
      COLOR 14: LOCATE 10, 5: INPUT "-->", Item.Cost
      WRITE #1, Item.Names, Item.Cost, Item.Dates, DATE$, TIME$
      INPUT "Add Another File(Y/N)?", Pick$
      Count = Count + 1
      Pick$ = UCASE$(Pick$)
   LOOP UNTIL Pick$ = "N"
   CLOSE #1
END SUB


SUB Menu (Choice AS INTEGER)
  DIM Pick AS STRING
  DO
   CLS : SCREEN 0
   COLOR 15: LOCATE 5, 5: PRINT "..Expendure Program.."
   COLOR 6: LOCATE 10, 5: PRINT "1"; : COLOR 2: PRINT "......."; : COLOR 14: PRINT "Create NEW expedature"
   COLOR 5: LOCATE 11, 4: PRINT "2"; : COLOR 3: PRINT "......."; : COLOR 14: PRINT "UpDate EXISTING expendature"
   COLOR 4: LOCATE 12, 3: PRINT "3"; : COLOR 4: PRINT "......."; : COLOR 14: PRINT "Print existing budget to screen"
   COLOR 3: LOCATE 13, 2: PRINT "4"; : COLOR 5: PRINT "......."; : COLOR 14: PRINT "Exit this Program"
   COLOR 3: LOCATE 14, 1: INPUT "Please select 1-4: ", Choice
   IF Choice = 1 THEN
      COLOR 31: PRINT "WARNING!"
      COLOR 10: PRINT "Creating a NEW file with the same name as a previous file name,"
      PRINT "all data previously stored will be LOST!"
      PRINT "Would you like to continue(Y/N)?"
      DO
      Pick$ = UCASE$(INKEY$)
      LOOP UNTIL UCASE$(Pick$) = "Y" OR UCASE$(Pick$) = "N"
   END IF
  LOOP UNTIL Pick$ = "Y" OR Choice = 4 OR Choice = 3 OR Choice = 2
END SUB

SUB PrintOut
   DIM File AS STRING
   DIM Count AS INTEGER
   DIM Names AS STRING
   DIM Cost AS INTEGER
   DIM Date2 AS STRING
   DIM Date1 AS STRING
   DIM Times AS STRING
   DIM Total AS INTEGER
   Count = 1
   CLS
   COLOR 15: INPUT "Please enter file name for file to view: ", File$
   OPEN File$ FOR INPUT AS #1
   LOCATE 3, 1
   DO WHILE NOT (EOF(1))
      INPUT #1, Names$, Cost, Date2$, Date1$, Times$
      PRINT Count; ":"; Names$, Date2$, USING "$$#,###.##"; Cost
      Count = Count + 1
      Total = Total + Cost
   LOOP
   COLOR 9: PRINT , , , "    ®_____¯"
   COLOR 13: PRINT "  Total Cost:", , , USING "$$#,###.##"; Total
   COLOR 14: LOCATE 1, 1: PRINT "[Time of File Accessed: "; Times$; "]"; " [Date of File Accessed: "; Date1$; "]"
   COLOR 15: LOCATE 2, 1: PRINT "- Expendature -", "- Date -", "    - Cost -"
   SLEEP
   CLOSE #1
END SUB

SUB UpDateOld (Item AS Record)
   CLS
   DIM File AS STRING
   DIM Pick AS STRING
   COLOR 15: LOCATE 1, 1: INPUT "Please enter the File to be UpDated:", File$
   OPEN File$ FOR APPEND AS #1
   Count = 1
   DO
      CLS
      COLOR 14: PRINT "Please enter your remaning expendatures:"
      COLOR 15: LOCATE 1, 2: PRINT "Please Enter Date of Product for Expendature #"; Count; ":"
      COLOR 14: LOCATE 2, 5: INPUT "-->", Item.Dates
      COLOR 15: LOCATE 5, 2: PRINT "Please Enter Name of Product for Expendature #"; Count; ":"
      COLOR 14: LOCATE 6, 5: INPUT "-->", Item.Names
      COLOR 15: LOCATE 9, 2: PRINT "Please Enter Cost of Procket for Expendature #"; Count; ":"
      COLOR 14: LOCATE 10, 5: INPUT "-->", Item.Cost
      WRITE #1, Item.Names, Item.Cost, Item.Dates, DATE$, TIME$
      INPUT "Add Another File(Y/N)?", Pick$
      Count = Count + 1
      Pick$ = UCASE$(Pick$)
   LOOP UNTIL Pick$ = "N"
   CLOSE #1
END SUB

