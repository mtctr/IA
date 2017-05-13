mp(X):-X >= 0, X < 0.5.
perto(X):-X >= 0.5, X < 1.5.
longe(X):-X >= 1.5, X =< 3.

seguir(RD,RE):- RD is 0.5, RE is 0.5.
vd(RD,RE):- RD is 0.1, RE is 0.5.
ve(RD,RE):- RD is 0.5, RE is 0.1.
vpd(RD,RE):- RD is 0.2, RE is 0.3.
vpe(RD,RE):- RD is 0.3, RE is 0.2.

girar(RD,RE):- RD is 0.5, RE is -0.5.

mov(SF, SD, SE, RD, RE):- longe(SF), longe(SD), longe(SE), seguir(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), longe(SD), perto(SE), vpd(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), longe(SD), mp(SE), vpd(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), perto(SD), longe(SE), vpe(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), perto(SD), perto(SE), seguir(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), perto(SD), mp(SE), vpd(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), mp(SD), longe(SE), vpe(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), mp(SD), perto(SE), vpe(RD,RE).
mov(SF, SD, SE, RD, RE):- longe(SF), mp(SD), mp(SE), seguir(RD,RE).

mov(SF, SD, SE, RD, RE):- perto(SF), longe(SD), longe(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), longe(SD), perto(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), longe(SD), mp(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), perto(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), perto(SD), perto(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), perto(SD), mp(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), mp(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), mp(SD), perto(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- perto(SF), mp(SD), mp(SE), girar(RD,RE).

mov(SF, SD, SE, RD, RE):- mp(SF), longe(SD), longe(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), longe(SD), perto(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), longe(SD), mp(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), perto(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), perto(SD), perto(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), perto(SD), mp(SE), vd(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), mp(SD), longe(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), mp(SD), perto(SE), ve(RD,RE).
mov(SF, SD, SE, RD, RE):- mp(SF), mp(SD), mp(SE),girar(RD,RE).
