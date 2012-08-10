DECLARE SUB getinfo (array!(), amount%)
DECLARE SUB Display (array!(), amount%)
DECLARE SUB sort (array(), amount%)
amount% = 10                         'the size of the array
CLS
DIM array(amount%)                   'The array to be sorted
                                   
CALL getinfo(array(), amount%)       'Gets the Input from user          

CALL sort(array(), amount%)          'Sorts the array

CALL Display(array(), amount%)       'Prints the sorted array

SUB Display (array(), amount%)

FOR index = 1 TO amount%
   PRINT array(index)     'Prints the numbers
NEXT

END SUB

SUB getinfo (array(), amount%)
   FOR index = 1 TO amount%
      INPUT "Please enter number:", array(index)
   NEXT index

END SUB

SUB sort (array(), amount%)
count = amount%
start = 1
flag = 1
DO
   count = count - 1    'Subtracts one each time thru, when its 0, the loop stops
   FOR index = start TO amount%
      IF array(index) < array(flag) THEN   'If the number is smaller than the next, swaps them
         flag = index  'Sets the flag to the same spot as the index
      END IF
   NEXT index
   IF start <> flag THEN  'if the start does not = the flag, then it swaps them
      SWAP array(start), array(flag)
   ELSE
      flag = flag + 1
   END IF
   start = start + 1
LOOP UNTIL count = 0

END SUB

