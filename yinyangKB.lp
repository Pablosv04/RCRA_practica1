#const n=4.

color(black;white).
row(1..n).
col(1..n).
1{cell(X,Y,C):color(C)}1 :- row(X),col(Y).
cell(1,4,white).
cell(2,4,black).
cell(3,2,black).
cell(3,3,white).
cell(4,4,white).

start(black,X,Y):-cell(X,Y,black),#min {X1+Y1: cell (X1,Y1,black)}= X+Y.
start(white,X,Y):-cell(X,Y,white),#min {X1+Y1: cell (X1,Y1,white)}= X+Y.

:-cell(X,Y,C), cell(X+1,Y,C), cell(X,Y+1,C), cell(X+1,Y+1,C), X<n, Y<n.

:- cell(X,Y,C1), cell(X,Y,C2), C1 != C2.

% Ensure reachability for the smallest black and white cells separately
reach(X,Y,C) :- start(C,X,Y).
%reach(1,1,0).
%reach(1,2,1).

reach(X,Y,C) :- cell(X,Y,C), reach(X-1,Y,C), X > 1.
reach(X,Y,C) :- cell(X,Y,C), reach(X+1,Y,C), X < n.
reach(X,Y,C) :- cell(X,Y,C), reach(X,Y-1,C), Y > 1.
reach(X,Y,C) :- cell(X,Y,C), reach(X,Y+1,C), Y < n.

:- cell(X,Y,C), not reach(X,Y,C), cell(X1,Y1,C), reach(X1,Y1,C).

#show cell/3.

