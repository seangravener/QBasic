CLS
OPEN "a:\test.dat" FOR OUTPUT AS #1
WRITE #1, "Steve Cambria", 11
WRITE #1, "Bob Gries", 12
WRITE #1, "Sean Gravener", 10
CLOSE #1

OPEN "a:\test.dat" FOR INPUT AS #1
INPUT #1, test$, test, test2$, test2, test3$, test3
PRINT test$; "-"; test;
PRINT test2$; "-"; test2;
PRINT test3$; "-"; test3
CLOSE #1

