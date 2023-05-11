solve_maze(Start, End, Path) :-
    move(Start, End, Path, [Start]).

move(End, End, Path, Path).

move(Current, End, Path, Visited) :-
    possible_move(Current, Next, End),
    \+ member(Next, Visited),
    move(Next, End, Path, [Next|Visited]).


:- dynamic low_wall/1.
:- dynamic high_wall/1.
:- dynamic portal/2.

% низкая стена
% low_wall((X,Y)).

% высокая стена
% high_wall((X,Y)).

% портал
% portal((X,Y), (M,N)).


% высокие стены
wall((X,Y)) :- 
    high_wall((X,Y)).
 
 % низкие стены
 wall((X,Y)) :- 
    low_wall((X,Y)).


possible_move((X,Y), (M,N), (XM, YM)) :-
    X >= 0, Y >= 0,
    portal((X,Y), (X1,Y1)),  % входной портал
    (M = X1, N = Y1);

    X >= 0, Y >= 0,
    (M is X-1, N = Y),       % вверх
    XM >= M, YM >= N,
    \+ wall((M,N));

    X >= 0, Y >= 0,
    (M is X+1, N = Y),       % вниз
    XM >= M, YM >= N,
    \+ wall((M,N));

    X >= 0, Y >= 0,
    (N is Y-1, M = X),       % влево
    XM >= M, YM >= N,
    \+ wall((M,N));
    
    X >= 0, Y >= 0,
    (N is Y+2, M = X),       % вправо
    N2 is Y + 1,
    XM >= M, YM >= N,
    \+ high_wall((M,N2)).