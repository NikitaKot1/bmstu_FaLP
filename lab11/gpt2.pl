solve_maze(Start, End, Path) :-
    move(Start, End, Path, [Start]).

move(End, End, Path, Path).

move(Current, End, Path, Visited) :-
    possible_move(Current, Next),
    \+ member(Next, Visited),
    move(Next, End, Path, [Next|Visited]).


low_wall((X,Y)).
high_wall((X,Y)).

% высокие стены
wall((X,Y)) :- 
    high_wall((X,Y)).
 
 % низкие стены
 wall((X,Y)) :- 
    low_wall((X,Y)).
 
 % порталы
%  wall((X,Y)) :-
%     portal((X,Y), _).
 
 % шипы
 wall((X,Y)) :-
    trap((X,Y)).
 
%  % дополнительно: шипы или высокие стены
%  wall((X,Y)) :-
%     high_wall((X,Y)); trap((X,Y)).


% портал входной
portal((X,Y), (M,N)).

possible_move((X,Y), (M,N)) :-
    portal((X,Y), (X1,Y1)),  % входной портал
    (M = X1, N = Y1);

    (M is X-1, N = Y),       % вверх
    \+ wall((M,N));

    (M is X+1, N = Y),       % вниз
    \+ wall((M,N));

    (N is Y-1, M = X),       % влево
    \+ wall((M,N));
    
    (N is Y+2, M = X),       % вправо
    \+ high_wall((M,N)).