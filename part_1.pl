main():-
  remarkableSet(A,B,C,D),
  format("~d,~d,~d,~d\n", [A, B, C, D]).

digit(D):-
  between(0,1000,D),
  D \= 1,
  D \=3,
  D \=8,
  D \=120.

oneLessPerfectSquare(D1,D2):-
  PSqr is D1*D2+1,
  Sqr is round(sqrt(PSqr)),
  PSqr is Sqr*Sqr.

remarkableSet(D1,D2,D3,D4):-
  digit(D1), digit(D2), digit(D3), digit(D4),
  D1<D2, D2<D3,D3<D4,
  oneLessPerfectSquare(D1,D2),
  oneLessPerfectSquare(D1,D3),
  oneLessPerfectSquare(D2,D3),
  oneLessPerfectSquare(D1,D4),
  oneLessPerfectSquare(D2,D4),
  oneLessPerfectSquare(D3,D4).
  % write(D1),write(","),write(D2),write(","),write(D3),write(","),write(D4).
