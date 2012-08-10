aa = 7
ab = 9
ac = 16

DIM a$(aa)
DIM b$(ab)
DIM c$(ac)
CLS

FOR index = 1 TO aa
   READ a$(index)
NEXT index

FOR index = 1 TO ab
   READ b$(index)
NEXT index

ain = 1
bin = 1
cin = 1

DO WHILE (ain <= aa) AND (bin <= ab)
   IF a$(ain) < b$(bin) THEN
   c$(cin) = a$(ain)
   ain = ain + 1
ELSE
   c$(cin) = b$(bin)
   bin = bin + 1
END IF
cin = cin + 1
LOOP

DO WHILE ain <= aa
   c$(cin) = a$(ain)
   ain = ain + 1
   cin = cin + 1
LOOP

DO WHILE bin <= ab
   c$(cin) = b$(bin)
   bin = bin + 1
   cin = cin + 1
LOOP

FOR i = 1 TO ab
  IF i <= aa THEN PRINT a$(i),
  IF i <= aa THEN
     PRINT b$(i)
  ELSE
     PRINT TAB(15); b$(i)
  END IF
  PRINT
NEXT i

FOR i = 1 TO ac
  PRINT TAB(30); c$(i)
  'PRINT c$(i)
NEXT

DATA "baez", "Christoph", "Guthrie", "Miller", "Mooser", "Smothers", "Travers"
DATA "Andrews", "Cohn", "Farina", "Garcia", "Kim", "Pontello", "Seeger", "Serez", "Wahl"

