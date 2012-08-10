'Sean Gravener period 3 1/29/98

'Tempature Section

INPUT "Please enter the tempature: ", temp

SELECT CASE temp
   CASE IS > 85
      PRINT "Swimming will be best"
   CASE IS > 70
      PRINT "Tennis will be best"
   CASE IS > 32
      PRINT "Golf will be best"
   CASE IS > 10
      PRINT "Skiing will be best"
   CASE IS > 9
      PRINT "Checkers will be best"
END SELECT

'Name section
INPUT "Please enter your Class: ", class$
SELECT CASE UCASE$(class$)
   CASE "HISTORY"
      PRINT "Ms. Mansfield"
   CASE "CALCULUS"
      PRINT "Ms. Mueller"
   CASE "SPANISH"
      PRINT "Mr. Johnson"
   CASE "ENGLISH"
      PRINT "Mr. Ramirez"
   CASE "ALGEBRA"
      PRINT "Mr. Ling"
   CASE ELSE
      PRINT "Invalid class"
END SELECT


