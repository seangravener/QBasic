'Sean Gravener period 3 1/29/98

'Tempature Section
INPUT "Please enter the tempature: ", temp
IF temp > 85 THEN
   PRINT "Swimming will be best"
ELSEIF temp > 70 THEN
   PRINT "Tennis will be best"
ELSEIF temp > 32 THEN
   PRINT "Golf will be best"
ELSEIF temp > 10 THEN
   PRINT "Skiing will be best"
ELSEIF temp <= 9 THEN
   PRINT "Checkers will be best"
END IF


'Name section
INPUT "Please enter your Class: ", class$
SELECT CASE class$
   CASE "History"
      PRINT "Ms. Mansfield"
   CASE "Calculus"
      PRINT "Ms. Mueller"
   CASE "Spanish"
      PRINT "Mr. Johnson"
   CASE "English"
      PRINT "Mr. Ramirez"
   CASE "Algebra"
      PRINT "Mr. Ling"
   CASE ELSE
      PRINT "Invalid class"
END SELECT


