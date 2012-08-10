'Sean Gravener
'This is some examples of graphics in QBasic
'GRAPHICS.BAS

'Number one     - TUNNELS -
CLS : SCREEN 12
x = 20
y = 20
x1 = 630
X2 = 450
'Draws the Boxes
FOR index = 1 TO 10
   LINE (x, y)-(x1, X2), index, B
   x = x + 20
   y = y + 20
   x1 = x1 - 20
   X2 = X2 - 20
NEXT

'Draws the Diagonals
LINE (20, 20)-(200, 200), 11
LINE (630, 20)-(450, 200), 12
LINE (630, 450)-(450, 270), 13
LINE (20, 450)-(200, 270), 14
SLEEP

'Number two     - CIRCLE CHAIN -
CLS
x = 150
FOR index = 1 TO 5
   CIRCLE (x, 150), 50, index + 10
   x = x + 80
NEXT
SLEEP

'Number three   - HOUSE -
CLS
'Main House part
LINE (400, 400)-(200, 200), 1, BF
'Circle windows
CIRCLE (250, 250), 10
CIRCLE (350, 250), 10

'Triangular Roof
LINE (200, 200)-(300, 100), 4
LINE (400, 200)-(300, 100), 4
LINE (400, 200)-(200, 200), 4

'Door
LINE (320, 400)-(280, 320), 14, BF
SLEEP

'Number Five    - RAINBOW -
CLS : SCREEN 13
x = 100
FOR index = 35 TO 60
   pi = (4 * ATN(1)) / 180
   CIRCLE (x, x), x, index, 0, 180 * pi
   x = x + 1
NEXT
SLEEP

'Number six     - DIE -
CLS : SCREEN 12
RANDOMIZE TIMER
x = 15: y = 30
LINE (200, 200)-(300, 300), , B
LINE (220, 220)-(320, 320), , B
LINE (200, 200)-(220, 220)
LINE (300, 200)-(320, 220)
LINE (200, 300)-(220, 320)
LINE (300, 300)-(320, 320)
dots = INT(1 + RND * 6)
FOR index = 1 TO dots
   COLOR 14: LOCATE x, y: PRINT "."
   x = x + 1
   y = y + 1
NEXT index
SLEEP

'Number three   -BUSY BEE-
COLOR 15: CLS : SCREEN 12
pi = (4 * ATN(1)) / 180
CIRCLE (300, 245), 25: LOCATE 15, 37: PRINT ". ."
CIRCLE (300, 245), 10, 14, 180 * pi, 0
COLOR 15
x = 300: y = 180
x1 = 260: y1 = 250
'center
LINE (x, y)-(x1, y1)
LINE (x, y)-(340, y1)
LINE (340, y1)-(x, 320)
LINE (x1, y1)-(x, 320)

'top left

