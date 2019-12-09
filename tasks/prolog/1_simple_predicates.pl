% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
	
	brother(X,Y) :- 
		father(F,X), 
		father(F,Y),
		not(X = Y).

	%?- brother(X,Y).
	
	% X = b, Y = c ;
	% X = c, Y = b ;
	% X = d, Y = e ;
	% X = e, Y = d ;


	cousin(X,Y) :-
		brother(F1,F2),
		father(F1,X),
		father(F2,Y).

	%?- cousin(X,Y).

	% X = d, Y = f ;
	% X = e, Y = f ;
	% X = f, Y = d ;
	% X = f, Y = e ;
	

	grandson(X,Y) :- 
		father(Y,F), 
		father(F,X).

	%?- grandson(X,Y).
	% X = d, Y = a ;
	% X = e, Y = a ;
	% X = f, Y = a ;


	descendent(X,Y) :- 
		father(F,X), 
		descendent(F,Y);
		father(Y,X). 

	%?- descendent(X,Y).
	% X = d, Y = a ;
	% X = e, Y = a ;
	% X = f, Y = a ;
	% X = b, Y = a ;
	% X = c, Y = a ;
	% X = d, Y = b ;
	% X = e, Y = b ;
	% X = f, Y = c.
