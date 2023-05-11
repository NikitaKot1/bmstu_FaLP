my_length([], 0):-!.
my_length([_|Tail], Index):- my_length(Tail, TailIndex), Index is TailIndex + 1.



my_sum_list([], 0):-!.
my_sum_list([Head|Tail], Sum):- my_sum_list(Tail, TailSum), Sum is TailSum + Head.




my_odd_sum([], Res, _, Acc):- Res is Acc, !.

my_odd_sum([Head|Tail], Sum, Flag, Acc):- 
            Flag =:= 1,
            NewAcc is Acc + Head,            
            my_odd_sum(Tail, Sum, 0, NewAcc).

my_odd_sum([_|Tail], Sum, _, Acc) :- 
            my_odd_sum(Tail, Sum, 1, Acc).

odd_sum(List, Sum) :- my_odd_sum(List, Sum, 0, 0).




new_list_help([], _, NewList):- NewList = Acc, !.

new_list_help([Head|Tail], Max, NewList, Acc) :- 
            Head > Max,
            NewAcc = [Head|Acc],
            new_list_help(Tail, Max, NewList, NewAcc).

new_list_help([_|Tail], Max, NewList, Acc) :- 
            new_list_help(Tail, Max, NewList, Acc).

new_big_list(List, Max, NewList) :- new_list_help(List, Max, NewList, []).



del_member_help([], _, NewList, Acc):- NewList = Acc, !.

del_member_help([Head|Tail], Mem, NewList, Acc) :- 
            Head = Mem,
            del_member_help(Tail, Mem, NewList, Acc).

del_member_help([Head|Tail], Mem, NewList, Acc) :- 
            NewAcc = [Head|Acc],
            del_member_help(Tail, Mem, NewList, NewAcc).

del_member(List, Mem, NewList) :- del_member_help(List, Mem, NewList, []).



concr_lists_help([], ListB, Res) :- Res = ListB, !.
concr_lists_help([Head|Tail], ListB, Res) :- NewL = [Head|ListB], concr_lists_help(Tail, NewL, Res).

concratinate_lists(ListA, ListB, Res) :- concr_lists_help(ListA, ListB, Res).