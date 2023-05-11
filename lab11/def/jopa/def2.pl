solve_maze(Start, End, Path) :-
    move(Start, End, Path, [Start], 1).

move(End, End, Path, Path, _).

move(Current, End, Path, Visited, Nst) :-
    possible_move(Current, Next, End, Nst),
    \+ member(Next, Visited),
    Nst1 is Nst + 1,
    move(Next, End, Path, [Next|Visited], Nst1).


:- dynamic low_wall/1.
:- dynamic high_wall/1.
:- dynamic portal/2.
:- dynamic trap_r/2.

% низкая стена
% low_wall((X,Y)).

% высокая стена
% high_wall((X,Y)).

% портал
% portal((X,Y), (M,N)).

% шипы
trap((X, Y), K, Nst) :- trap_r((X, Y), K), (Nst mod K) \== 0.

% высокие стены
wall((X,Y), _) :- 
    high_wall((X,Y)).
 
 % низкие стены
 wall((X,Y), _) :- 
    low_wall((X,Y)).

wall((X,Y), Nst) :-
    trap((X,Y), _, Nst).


possible_move((X,Y), (M,N), (XM, YM), Nst) :-
    X >= 0, Y >= 0,
    portal((X,Y), (X1,Y1)),  % входной портал
    (M = X1, N = Y1);

    X >= 0, Y >= 0,
    (N is Y-1, M = X),       % вверх
    XM >= M, YM >= N,
    \+ wall((M,N), Nst);

    X >= 0, Y >= 0,
    (N is Y+1, M = X),       % вниз
    XM >= M, YM >= N,
    \+ wall((M,N), Nst);

    X >= 0, Y >= 0,
    (N is Y-1, M = X),       % влево
    XM >= M, YM >= N,
    \+ wall((M,N), Nst);
    
    X >= 0, Y >= 0,
    (M is X+2, N = Y),       % вправо
    M2 is X + 1,
    XM >= M, YM >= N,
    \+ high_wall((M2,N)),
    \+ wall((M,N), Nst).