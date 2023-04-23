max2(N1, N2, N2)    :- N2 >= N1.
max2(N1, N2, N1)    :- N1 >= N2.

max3(N1, N2, N3, N1)    :- N1 >= N2, N1 >= N3.
max3(N1, N2, N3, N2)    :- N2 >= N1, N2 >= N3.
max3(N1, N2, N3, N3)    :- N3 >= N1, N3 >= N2.

max2clip(N1, N2, N2)    :- N2 >= N1, !.
max2clip(N1, _, N1).

max3clip(N1, N2, N3, N1)    :- N1 >= N2, N1 >= N3, !.
max3clip(_, N2, N3, N2)    :- N2 >= N3, !.
max3clip(_, _, N3, N3).