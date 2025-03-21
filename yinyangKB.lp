color(black;white).
row(0..n-1).
col(0..n-1).
gridsize(n).
1{cell(X,Y,C):color(C)}1 :- row(X),col(Y).

start(black,X,Y):-cell(X,Y,black),#min {X1+Y1: cell (X1,Y1,black)}= X+Y.
start(white,X,Y):-cell(X,Y,white),#min {X1+Y1: cell (X1,Y1,white)}= X+Y.

:-cell(X,Y,C), cell(X+1,Y,C), cell(X,Y+1,C), cell(X+1,Y+1,C), X<n-1, Y<n-1.

:-cell(X,Y,C), cell(X+1,Y,C'), cell(X,Y+1,C'), cell(X+1,Y+1,C), X<n-1, Y<n-1.

:- cell(X,Y,C1), cell(X,Y,C2), C1 != C2.

reach(X,Y,C) :- start(C,X,Y).

reach(X,Y,C) :- cell(X,Y,C), reach(X-1,Y,C), X > 0.
reach(X,Y,C) :- cell(X,Y,C), reach(X+1,Y,C), X < n-1.
reach(X,Y,C) :- cell(X,Y,C), reach(X,Y-1,C), Y > 0.
reach(X,Y,C) :- cell(X,Y,C), reach(X,Y+1,C), Y < n-1.

:- cell(X,Y,C), not reach(X,Y,C), cell(X1,Y1,C), reach(X1,Y1,C).

_drawcircle(X,Y,C) :- cell(X,Y,C).

#show cell/3.

