REM Setup screen
SCREEN 1
KEY OFF
COLOR 15, 5, 15

REM Initialize randomizer
I = RND(-TIME)

REM Shot sprites and enemy positions
DIM P$(2), U(2), V(2)

REM Initialize enemy positions
FOR I = 1 TO 2
  U(I) = INT(RND(1) * 400)
  V(I) = 10
NEXT I

REM Player X position
X = 100
REM Enemy target Y value
F = 180
REM Shot Y position
H = -30

REM Load background tiles
FOR J = 0 TO 1
  READ A$
  FOR K = 1 TO 8
    VPOKE (&H28 + J) * 8 + K - 1, ASC(MID$(a$, ((K + I) MOD 8) + 1, 1))
  NEXT K
NEXT J

REM Load player and enemy sprites
READ A$, B$
SPRITE$(20) = A$
FOR J = 0 TO 1
  SPRITE$(25 + J) = B$
NEXT J

REM Load shot sprites
READ P$(1), P$(2)

REM Draw field
FOR I = 0 TO 24
  PRINT "€€€€€(" + SPACE$(15) + ")€€€€€"
NEXT I

REM Lives
L = 3

REM Load lives character
FOR K = 1 TO 8
  VPOKE (&H27) * 8 + K - 1, ASC(MID$(a$, (K MOD 8) + 1, 1))
NEXTK

REM Graphics data
DATA ®tÙËË–∞®,Wªø__/7W,$$<~~ˇˇf,Å€ˇˇˇ~~$,¿@Ä@Ä@Ä@,¿Ä@Ä@Ä@Ä

REM Player Y position
Z = 160
REM Field width
C = 200
REM Enemy X position calculation loop point
D = 400

REM Main game loop
loop:
I = I + 1

REM Alternate shot graphics
SPRITE$(21) = P$((I MOD 2) + 1)

REM Calculate enemy movement multiplier
EM = (N \ 5) * 0.25 + 1

REM Draw player
PUT SPRITE 20, (X, Z), 12

FOR J = 1 TO 2
  REM Calculate enemy X position. This equation gives a triangle wave
  Q = ABS(((U(J) + V(J) * EM) MOD D) - C) + 20

  REM Detect shot collision with enemy
  IF Q < G AND G < Q + 8 AND V(J) - 8 < H AND H < V(J) + 8 THEN H = -10 : V(J) = -10 : N = N + 1 : ELSE IF V(J) > F THEN GOTO lose

  REM Draw enemy
  PUT SPRITE 25 + J - 1, (Q, V(J)), 8

  REM Calculate next enemy position
  V(J) = V(J) + EM
NEXT J

REM Draw shot
PUT SPRITE 21, (G, H), 3

REM Calculate joystick state
S = ABS(STICK(0) + STRIG(0))

REM Calculate next shot position
IF H >= 0 THEN H = H - 10

REM Handle joystick state
IF S = 6 THEN X = X - 2 : H = Z : G = X + 4 ELSE IF S > 5 THEN X = X - 4 ELSE IF S = 2 THEN X = X + 2 : H = Z : G = X + 4 ELSE IF S > 1 THEN X = X + 4 ELSE IF S = 1 THEN H = Z : G = X + 4

REM Wrap player position between 20 and 220
X = ((X + 180) MOD 200) + 20

REM Display score and lives
W$ = STR$(n)
LOCATE 0, 0
PRINT STRING$(L, 39) + SPACE$(16 - L - LEN(W$)) + "SCORE: " + W$ + "000"

GOTO loop

REM Lose a life
lose:
REM Move enemy back to top
V(J) = -10

COLOR 15, 9, 15

L=L-1

IF L < 0 THEN LOCATE 10, 10: PRINT "GAME OVER!": L = 0: GOTO lose: ELSE FOR J = 0 TO 10: NEXT J: COLOR 15, 5, 15: GOTO loop