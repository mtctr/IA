function [x1 x2] = crossover(p1, p2, mask)
x1 = (p1 & mask) | p2 & not(mask);
x2 = (p1 & not(mask) | p2 & mask);