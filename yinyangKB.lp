
color(black;white).
row(0..n-1).
col(0..n-1).
gridsize(n).
1{_drawcircle(X,Y,C):color(C)}1 :- row(X),col(Y).

start(black,X,Y):-_drawcircle(X,Y,black),#min {X1+Y1: _drawcircle (X1,Y1,black)}= X+Y.
start(white,X,Y):-_drawcircle(X,Y,white),#min {X1+Y1: _drawcircle (X1,Y1,white)}= X+Y.

:-_drawcircle(X,Y,C), _drawcircle(X+1,Y,C), _drawcircle(X,Y+1,C), _drawcircle(X+1,Y+1,C), X<n, Y<n.

:- _drawcircle(X,Y,C1), _drawcircle(X,Y,C2), C1 != C2.

% Ensure reachability for the smallest black and white _drawcircles separately
reach(X,Y,C) :- start(C,X,Y).
%reach(1,1,0).
%reach(1,2,1).

reach(X,Y,C) :- _drawcircle(X,Y,C), reach(X-1,Y,C), X > 0.
reach(X,Y,C) :- _drawcircle(X,Y,C), reach(X+1,Y,C), X < n-1.
reach(X,Y,C) :- _drawcircle(X,Y,C), reach(X,Y-1,C), Y > 0.
reach(X,Y,C) :- _drawcircle(X,Y,C), reach(X,Y+1,C), Y < n-1.

:- _drawcircle(X,Y,C), not reach(X,Y,C), _drawcircle(X1,Y1,C), reach(X1,Y1,C).

#show _drawcircle/3.

