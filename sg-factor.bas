DECLARE FUNCTION calc! (num!)
CLS
INPUT "Enter a number: ", num
PRINT "The Factorial of"; num; "is"; calc(num)

FUNCTION calc (num)
   fact = num
   FOR index = num - 1 TO 1 STEP -1
      fact = fact * index
   NEXT
   calc = fact
END FUNCTION

