% факты 
cell(1, 1, start). 
% стартовая клетка 
cell(N, M, finish) :- N =< n, M =< m. 
% конечная клетка % N - количество строк, M - количество столбцов

portal(N).

% факты порталов с номерами 1 и 2
portal(1).
portal(2).
% связывание порталов между собой
linked_portals(1, 2).
linked_portals(2, 1).

% правила
route(X, Y, _, _) :- cell(X, Y, portal(N)), !,
    linked_portals(N, M),
    % перемещение на соседнюю клетку портала M
    ...

% типы клеток 
cell(N, M, wall) :- ... 
% условия для высокой стены 
cell(N, M, lowwall) :- ... % условия для низкой стены 
cell(N, M, spikes) :- ... % условия для шипов 
cell(N, M, portal) :- ... % условия для портала

% правила 
route(X, Y, _, _) :- cell(X, Y, wall), !, fail. 
% обход стены 
route(X, Y, _, _) :- cell(X, Y, spikes), !, fail. % обход шипов

route(X, Y, _, _) :- cell(X, Y, portal), ... % обработка портала

route(N, M, _, _) :- cell(N, M, finish). % достигнута конечная клетка 
route(X, Y, Visited, Path) :- move(X, Y, X1, Y1), \+ member(X1-Y1, Visited), route(X1, Y1, [X1-Y1|Visited], [X1-Y1, X-Y|Path]), !.


% возможные перемещения 
move(X, Y, X1, Y) :- X1 is X-1, X1 > 0, \+ cell(X1, Y, wall). move(X, Y, X1, Y) :- X1 is X+1, X1 =< n, \+ cell(X1, Y, wall). 
move(X, Y, X1, Y) :- X1 is X+2, X1 =< n, \+ cell(X1, Y, spikes), \+ cell(X1-1, Y, lowwall). 
move(X, Y, X, Y1) :- Y1 is Y-1, Y1 > 0, \+ cell(X, Y1, wall). 
move(X, Y, X, Y1) :- Y1 is Y+1, Y1 =< m, \+ cell(X, Y1, wall).

% поиск маршрута find_route(Path) :- route(1, 1, [1-1], Path), !. find_route('No path found.').