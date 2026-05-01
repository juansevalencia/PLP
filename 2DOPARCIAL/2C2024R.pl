objeto(1,50,10).
objeto(2,75,15).
objeto(3,60,5).
objeto(4,10,1).

esCreciente([]).
esCreciente([X|Xs]):- not((member(Y,Xs), Y =< X)) ,esCreciente(Xs). 
%esCreciente(L):- append(_,[X|L2],L), not((member(Y,L2), X >= Y )).
%Esto est mal porque esta encontrando una lista tal q haya una lista tal q un elemento cumpla con el not. No todos. 


%Porque este es creciente no funciona

mochila(C, L):- mochilaCapacidadC(C, L) ,esCreciente(L).

mochilaCapacidadC(C, []):- C >= 0.
mochilaCapacidadC(C, [Id|Xs]):- C > 0, objeto(Id, P, _), C2 is C-P, mochila(C2, Xs), not(member(Id, Xs)).

%el C >= 0 tiene que ir si o si porque si no cicla infinitamente intentando que C >= 0 pero en algunos casos se esta yendo a menos infinito y no corta porque en el
%llamado recursivo de abajo, siempre se instancia un objeto y siempre se llama a mochila.

%ahora el problema de esto es que objeto siempre instancia el mismo cada vez q se llama a mochila, entonces hay q verificar que los ID sean crecientes para ver que esten ordenados.


esRotacion([X|Xs], R):- append(L2,L1,Xs), append(L1,[X|L2],R). 