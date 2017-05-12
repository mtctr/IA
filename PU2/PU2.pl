perto(X):-X >= 0, X < 1.
longe(X):-X >= 1, X =< 3.
seguir(RD,RE):- RD is 0.5, RE is 0.5.
vd(RD,RE):- RD is 0.3, RE is 0.5.
ve(RD,RE):- RD is 0.5, RE is 0.3.
girar(RD,RE):- RD is 0.5, RE is -0.5.

mov(SF, SD, SE, RD, RE):- longe(SF), longe(SD), longe(SE), seguir(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), longe(SD), perto(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), perto(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), perto(SD), perto(SD), seguir(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), longe(SD), longe(SE), girar(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), longe(SD), perto(SD), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), perto(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), perto(SD), perto(SD), girar(RD,RE).
