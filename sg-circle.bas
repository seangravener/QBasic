CLS
SCREEN 12
RANDOMIZE TIMER
FOR index = 1 TO 100
   FOR index2 = 15 TO 30
      ran = INT(1 + RND * 15)
      CIRCLE (index, index), index, ran
   NEXT
NEXT

