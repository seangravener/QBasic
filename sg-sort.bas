'Sean Gravener
'Sort.bas  Bubble sort:

OPTION BASE 1
DIM num(5) AS INTEGER
CLS

FOR getit = 1 TO 5
   READ num(getit)
NEXT
flag = 0
final = 4
DO
   FOR i = 1 TO final
      IF num(i) > num(i + 1) THEN SWAP num(i), num(i + 1): flag = 1
   NEXT
final = final - 1
LOOP UNTIL final = 0

FOR getit = 1 TO 5
   PRINT num(getit)
NEXT getit

DATA 10, 5, 3, 2, 4

