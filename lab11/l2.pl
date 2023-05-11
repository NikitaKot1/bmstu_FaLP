my_length(List, Length) :- my_length(List, 0, Length).
my_length([], Acc, Acc) :- !.
my_length([_|T], Acc, Length) :- !,
    NewAcc is Acc + 1,
    my_length(T, NewAcc, Length).



my_sum_list(List, Sum) :- my_sum_list(List, 0, Sum), !.
my_sum_list([], Acc, Acc) :- !.
my_sum_list([H|T], Acc, Sum) :- 
    NewAcc is Acc + H,
    my_sum_list(T, NewAcc, Sum).



my_odd_sum(List, Sum) :- !,
    my_odd_sum(List, 0, Sum).
my_odd_sum([], Sum, Sum) :- !.
    my_odd_sum([_], Sum, Sum).
my_odd_sum([_, X|T], Acc, Sum) :-
    NewAcc is Acc + X,
    my_odd_sum(T, NewAcc, Sum).



new_big_list([], _, []) :- !.
new_big_list([X|Xs], Y, [X|Ys]) :- X > Y, !, new_big_list(Xs, Y, Ys).
new_big_list([X|Xs], Y, Ys) :- !, new_big_list(Xs, Y, Ys).



del_member(_, [], []) :- !.
del_member(X, [X|Tail], Tail) :- !.
del_member(X, [Y|Tail], [Y|Tail1]) :-
    del_member(X, Tail, Tail1).



del_all_member(_, [], []) :- !.
del_all_member(X, [X|Tail], Result) :- !,
    del_all_member(X, Tail, Result).
del_all_member(X, [Y|Tail], [Y|Tail1]) :- del_all_member(X, Tail, Tail1).



concratinate_lists([], L, L) :- !.
concratinate_lists([H|T], L, [H|Result]) :- concratinate_lists(T, L, Result).