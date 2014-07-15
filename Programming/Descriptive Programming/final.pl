
main(X) :-go(X,[X,X,1],[0,0,0]),nl.

go(N,StartState,GoalState):-
        find_path(N,StartState,GoalState,[StartState],[],Moves),
        write('A solution is:\n\n'),
        reverse1(Moves,Moves2),
        write_moves(Moves2,0).

find_path(N,StartState,GoalState,VisitedPath,Moves1,Moves2):-
        move(N,StartState,NextState,Move),
        safe(N,StartState,Move),
        not( member1(NextState,VisitedPath) ),
        find_path(N,NextState,GoalState,[NextState|VisitedPath],[Move|Moves1],Moves2),!.
find_path(_,GoalState,GoalState,_,Moves,Moves).

/*Left To Right*/
  move(_,[I1,J1,1],[I2,J2,0],[1,1,'1 keshish & 1 adamkhar go from left to right']):- I2 is I1-1 , J2 is J1-1 , I1>0 , J1>0 . % Move 1 keshish  + 1 adamkhar
  move(_,[I1,J1,1],[I2,J1,0],[2,0,'2 keshish from left to right']):- I2 is I1-2 , I1>1 . % Move 2 keshish
  move(_,[I1,J1,1],[I1,J2,0],[0,2,'2 adamkhar go from left to right']):- J2 is J1-2 , J1>1 . % Move 2 adamkhar
  move(_,[I1,J1,1],[I2,J1,0],[1,0,'1 keshish goes from left to right']):- I2 is I1-1 , I1>0 . % Move 1 keshish
  move(_,[I1,J1,1],[I1,J2,0],[0,1,'1 adamkhar goes from left to right']):- J2 is J1-1 , J1>0 . % Move 1 adamkhar

/*Right To Left*/
  move(N,[I1,J1,0],[I2,J2,1],[1,1,'1 keshish & 1 adamkhar go from right to left']):- I2 is I1+1 , J2 is J1+1 , I1<N , J1<N . % Move 1 keshish  + 1 adamkhar
  move(N,[I1,J1,0],[I2,J1,1],[2,0,'2 keshish from right to left']):- I2 is I1+2 , I1<N-1  . % Move 2 keshish
  move(N,[I1,J1,0],[I1,J2,1],[0,2,'2 adamkhar go from right to left']):- J2 is J1+2 , J1<N-1   . % Move 2 adamkhar
  move(N,[I1,J1,0],[I2,J1,1],[1,0,'1 keshish goes from right to left']):- I2 is I1+1 , I1<N . % Move 1 keshish
  move(N,[I1,J1,0],[I1,J2,1],[0,1,'1 adamkhar goes from right to left']):- J2 is J1+1 , J1<N . % Move 1 adamkhar


 safe(_,[I,J,1],[X,Y,_]) :- RemainedI is I-X , RemainedJ is J-Y , RemainedI>=RemainedJ .
 safe(N,[I,J,0],[X,Y,_]) :- OthersideI is N-I , OthersideJ is N-J , RemainedI is OthersideI-X , RemainedJ is OthersideJ-Y , RemainedI>=RemainedJ.

 write_moves([],_):-!.
 write_moves([H|T],Count) :- Count2 is Count+1, write_move(H,Count2),write_moves(T,Count2).

 write_move([_,_,S],Count) :- write(Count),write(' > '),write(S),nl,nl.
 
 member1(X,[X|_]).
 member1(X,[_|L]):-member1(X,L).

 reverse1([],[]).
 reverse1([H|T],T3) :- reverse1(T,T2) , append1(T2,H,T3).

 append1([],X,[X]):-!.
 append1([H|T],X,[H|T2]) :- append1(T,X,T2).







