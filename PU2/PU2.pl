perto(X):-X >= 0, X < 1.
longe(X):-X >= 1, X =< 3.
seguir(RD,RE):- RD is 0.5, RE is 0.5.
vd(RD,RE):- RD is -0.3, RE is 0.5.
ve(RD,RE):- RD is 0.5, RE is -0.3.

mov(SF, SE, SD, RD, RE):- longe(SF), longe(SE), longe(SD), seguir(RD,RE).
mov(SF, SE, SD, RD, RE):- longe(SF), longe(SE), perto(SD), ve(RD,RE).
mov(SF, SE, SD, RD, RE):- longe(SF), perto(SE), longe(SD), vd(RD,RE).
mov(SF, SE, SD, RD, RE):- longe(SF), perto(SE), perto(SD), seguir(RD,RE).
mov(SF, SE, SD, RD, RE):- perto(SF), longe(SE), perto(SD), ve(RD,RE).
mov(SF, SE, SD, RD, RE):- perto(SF), perto(SE), longe(SD), vd(RD,RE).
