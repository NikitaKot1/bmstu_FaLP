parent(olga, oleg, f).
parent(ivan, oleg, m).

parent(oleg, yaroslav, m).
parent(inga, yaroslav, f).

parent(oleg, kate, m).
parent(inga, kate, f).

parent(nikita, georg, m).
parent(sveta, georg, f).

parent(yaroslav, stepan, m).
parent(irina, stepan, f).

parent(georg, sergey, m).
parent(kate, sergey, f).
parent(georg, alex, m).
parent(kate, alex, f).
parent(georg, nika, m).
parent(kate, nika, f).

grandparent(X, Y)   :- parent(X, Z, _), parent(Z, Y, _).
grandmother(X, Y)   :- parent(X, Z, f), parent(Z, Y, _).
grandfather(X, Y)   :- parent(X, Z, m), parent(Z, Y, _).

maternal_grandmother(X, Y)   :- parent(X, Z, f), parent(Z, Y, f).
maternal_grandparent(X, Y)   :- parent(X, Z, _), parent(Z, Y, f).