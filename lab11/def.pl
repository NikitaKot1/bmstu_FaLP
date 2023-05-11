% death(Health) :- Health = 0, !

% portal(1, 2, 5, 6). % портал унифицирует одеу клетку в другую



% move(X, Y, up) :- NewY is Y + 1, .

:- dynamic fact_my/2.

fact_my(0,1).

fact_my(N,X):-N > 0, N2 is N-1, fact_my(N2,X2), X is X2*N, assert(fact_my(N,X)).