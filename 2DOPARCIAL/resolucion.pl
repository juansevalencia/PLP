natural(cero). 
natural(suc(X)) :- natural(X).


nota(do).
nota(re).
nota(mi).
nota(fa).



mayorOIgual(suc(X),Y) :- mayorOIgual(X, Y).
mayorOIgual(X,X) :- natural(X).

listaAMelodia([X], X):- nota(X).
listaAMelodia([X|L3], sec(M1,M2)):- L3 \= [], append(L1,L2,L3), L2 \= [], listaAMelodia([X|L1], M1), listaAMelodia(L2, M2). 

listaAMelodia2([X],X):- nota(X).
listaAMelodia2(L, sec(M1,M2)):- append(L1,L2,L), L1 \= [], L2 \= [], listaAMelodia2(L1,M1), listaAMelodia2(L2,M2).

submelodia(sec(M1,M2),sec(M1,M2)).
submelodia(sec(M1,_),S):- submelodia(M1,S).
submelodia(sec(_,M2),S):- submelodia(M2,S). 

sinSubmelodiaEnComun(M1,M2):- not((submelodia(M1,S1), submelodia(M2,S1))).

melodia(M):- desde(1,N), melodiasTamN(N,M).

melodiasTamN(1,M):-nota(M).
melodiasTamN(N,sec(M1,M2)):- N>1, N2 is N-1, between(1,N2,X), V is N2-X ,melodiasTamN(X,M1), melodiasTamN(V,M2). 

preorder(nil, []).
preorder(bin(I,R,D), [R|L]):- append(LI,LD,L), preorder(I,LI), preorder(D,LD).

esTriangulo(tri(A,B,C)):- A< B+C, B< A+C, C< A+B, A > abs(B-C), B > abs(A-C), C > abs(A-C).

desde(X,X).
desde(X,Y):- V is X+1, desde(V,Y).


generarCapicuas(L):- desde(1,N), capicuasTamañoN(N,L).

capicuasTamañoN(1,[X]):- natural(X).
capicuasTamañoN(2, [X,Y]):- natural(X), natural(Y).
capicuasTamañoN(N, [X|L]):- N > 2, append(L1,[X],L), L2 \= [], V is N-2, natural(X), capicuasTamañoN(V,L2).