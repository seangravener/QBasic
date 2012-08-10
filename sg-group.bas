'Greg Kubovcik,  Sean Gravener,  Mike Hinson
'Group Sorting Program
'Period 3  2/13/98
CLS
INPUT "Please enter the size of your array:"; size
DIM flag(size) 'Array to know if a number has been used
DIM num(size)  'The array where the unsorted numbers are stored
DIM sort(size) 'The array that the numbers are put into when sorted

FOR index = 1 TO size  'Asks user to enter numbers to be used
   INPUT "Enter a number:"; num(index)
NEXT index
count = 1
start = 1
DO  'loops until count(how many times the loop has been exectued) is >
    'the size of the *num* array
   got.a.start = 0  'Sets the variable to 0
   DO  'loops until the array flag(1) doesen't = 1 and the minimum
       '# is set to a position in the *sort* array
      IF flag(start) <> 1 THEN
         min = num(start)
         got.a.start = 1
      ELSEIF start < size THEN
         start = start + 1
      END IF
   LOOP UNTIL got.a.start = 1
   FOR index2 = 1 TO size   'if the next num is greater than the first
                            'minimum, it sets that number to the next
                            'place in the *sort* array
      IF num(index2) < min AND flag(index2) <> 1 THEN
         min = num(index2)
         minindex = index2
      END IF
   NEXT index2
   IF min = num(start) THEN minindex = start
   sort(count) = min
   flag(minindex) = 1
   count = count + 1
LOOP UNTIL count > size

PRINT "original:"   'Prints out the original Numbers enterd
FOR i = 1 TO 5
  PRINT num(i)
NEXT

PRINT : PRINT
PRINT "sorted"     'Prints out the sorted numbers
PRINT
FOR index3 = 1 TO size
   PRINT sort(index3)
NEXT index3
END

