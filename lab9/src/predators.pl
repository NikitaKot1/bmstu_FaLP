father(ivan, petya).

mother(dasha, slavya).

parent(X, Y)        :- father(X, Y); mother(X, Y).

grandfather(X, Y)   :- parent(X, Z), father(Z, Y).
grandmother(X, Y)   :- parent(X, Z), mother(Z, Y).
grandparent(X, Y)   :- parent(X, Z), parent(Z, Y).