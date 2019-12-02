main(W) :-

  %Parsing input which is a list containg a single string Ex: ["Input goes here"]
  %Converting it to a list of strings. Ex:"["Input", "goes", "here"]"
  atomic_list_concat(W,' ',L),
  atom_string(L,Sent),
  split_string(Sent," "," ",List),

  %If and Else statement. Prints out list if it matches sentence parse else invalid.
  (phrase(sentence,List) ->
    phrase(number,ListNum),
    atomic_list_concat(ListNum,'',Lis1),
    atom_string(Lis1,Char1),
    number_codes(Num,Char1),
    phrase(sum,ListSum),
    atomic_list_concat(ListSum,'',Lis2),
    atom_string(Lis2,Char2),
    number_codes(Sum,Char2),
    format("Number:~d Sum:~d\n",[Num,Sum])
    % print(Sum),nl
    ; format("Invalid String"), nl
    ).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sentence --> verb,article,noun.
% article --> ["a"].
% noun -->["set"].
% verb -->["find"].
%%%Use
%swipl -q -f test.pl -t main "find a set"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % print(L).
  % format('~s\n', W).

  % main(S):-
  %   2 is round(sqrt(4)),
  %   write(one).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Commmands for running programming
%%%Using text files as input
% in=$(cat in1.txt)
% swipl -q -f test.pl -t main "$in" > out1.txt
% python autograder.py 1

%%%Using string as input
% swipl -q -f test.pl -t main "Example Input String"
%swipl -q -f test.pl -t main "find a set of 3 odd integers that sum to 15"


% some clauses to help us:
isEven(X) :-
  integer(X),
  X mod 2 =:= 0.

allEven([]).
allEven([H|T]) :-
  isEven(H),
  allEven(T).

isOdd(X) :-
  integer(X),
  X mod 2 =:= 1.

isBoth(X) :-
  integer(X).

sumTo([], 0).
sumTo([H|T], X) :-
  Y is X-H,
  sumTo(T, Y).

mulTo([], 1).
mulTo([H|T], X) :-
  Y is X/H,
  sumTo(T, Y).


naturalNumber(0).
naturalNumber(X):-
  naturalNumber(Y),
  X is Y+1.

printList([]) :-
  format("\n", []).
printList([X|Tail]) :-
  format("~d ", [X]),
  printList(Tail).

sumToWithSize(0, [], Size) :- Size =:= 0.
sumToWithSize(N, [X | Tail], Size) :-
    between(1, N, X),
    Y is N-X,
    Z is Size-1,
    sumToWithSize(Y, Tail, Z).

mulToWithSize(1, [], Size) :- Size =:= 0.
mulToWithSize(N, [X | Tail], Size) :-
    between(2, N, X),
    Y is N/X,
    integer(Y),
    Z is Size-1,
    mulToWithSize(Y, Tail, Z).

opToWithSize(add, 0, [], Size) :- Size =:= 0.
opToWithSize(add, N, [X | Tail], Size) :-
    between(1, N, X),
    Y is N-X,
    Z is Size-1,
    opToWithSize(add, Y, Tail, Z).
opToWithSize(mul, 1, [], Size) :- Size =:= 0.
opToWithSize(mul, N, [X | Tail], Size) :-
    between(2, N, X),
    Y is N/X,
    integer(Y),
    Z is Size-1,
    opToWithSize(mul, Y, Tail, Z).



% countOdd is countOdd - (Y mod 2)
% countEven is countEven - (1 - (Y mod 2))



%Example input: Find a set of 3 odd integers that sum to 15
%Output:3,5,7
%Input: Find a set of 2 even integers that sum to 6

%We want ot break up the sentence "Find a set of 3 odd integers that sum to 15" as:
% sentence("Find a set of") I("3 odd integers") -> I(O("3 odd")) pronoun("that") Op("sum")  preposition("to") number("15")
%sentence broken down with sent_phrase, integer_phrase,pronoun, op,preposition,number

% sentenceWithEven --> sent_phrase,integer_phrase_even,pronoun,op,preposition,number.
% integer_phrase_even --> number, "even", noun, .


sentence --> sent_phrase,integer_phrase,pronoun,op,preposition,sum.
sent_phrase --> verb,article,noun, preposition.
integer_phrase --> number, int_property, noun.
integer_phrase --> number, int_property,conjuction,number, int_property,noun.
pronoun --> ["that"].
op --> ["multiply"] | ["sum"].
preposition --> ["to"] | ["of"].
int_property --> ["even"] | ["odd"].
conjuction  --> ["and"].
article --> ["a"].
noun --> ["set"] | ["integers"].
verb --> ["Find"].
number --> ["3"].
sum --> ["15"].
% naturalNumber(X) -->
