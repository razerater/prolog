[library(dcg/basics)].
main(W) :-

  %Parsing input which is a list containg a single string Ex: ["Input goes here"]
  %Converting it to a list of strings. Ex:"["Input", "goes", "here"]"
  atomic_list_concat(W,' ',L),
  atom_string(L,Sent),
  split_string(Sent," "," ",List),

  %If and Else statement. Prints out list if it matches sentence parse else invalid.

  (phrase(sentenceSum,List) ->
    %Extracting number from phrase
    phrase(number,ListNum),
    atomic_list_concat(ListNum,'',Lis1),
    atom_string(Lis1,Char1),
    number_codes(Num,Char1),
    %Extracting sum from phrase
    phrase(sum,ListSum),
    atomic_list_concat(ListSum,'',Lis2),
    atom_string(Lis2,Char2),
    number_codes(Sum,Char2),

    phrase(opSum, OpList),
    atomic_list_concat(OpList,'',Operation),
    opToWithSize(Operation,Sum,[1,5,9],Num),




    format("Number:~d Sum:~d Operation:~s\n",[Num,Sum, Operation])

      % print(List),nl
    ;phrase(sentenceMult,List) ->
      phrase(number,ListNum),
      atomic_list_concat(ListNum,'',Lis1),
      atom_string(Lis1,Char1),
      number_codes(Num,Char1),
      %Extracting sum from phrase
      phrase(multiply,ListMult),
      atomic_list_concat(ListMult,'',Lis2),
      atom_string(Lis2,Char2),
      number_codes(Multiply,Char2),

      phrase(opMult, OpList),
      atomic_list_concat(OpList,'',Operation),
      % opToWithSize(Operation,Sum,[1,5,9],Num),

      format("Number:~d Sum:~d Operation:~s\n",[Num,Multiply, Operation])
    ;format("Invalid String"), nl
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
% digit(D)-->
%   [D],
%   { code_type(D,digit)}.
%
% digit_weight(W)-->
%   [D],
%   { code_type(D,digit(W))}.

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



opToWithSize(add, 0, [], 0).
opToWithSize(add, N, [X | Tail], Size) :-
  between(1, N, X),
  Y is N-X,
  Z is Size-1,
  opToWithSize(add, Y, Tail, Z).
opToWithSize(mul, 1, [], 0).
opToWithSize(mul, N, [X | Tail], Size) :-
  between(1, N, X),
  Y is N/X,
  integer(Y),
  Z is Size-1,
  opToWithSize(mul, Y, Tail, Z).


opToWithSize(add, 0, [], 0, 0, 0).
opToWithSize(add, N, [X | Tail], NumEvens, NumOdds, NumBoth) :-
  between(1, N, X),
  Y is N - X,
  NewNumBoth is NumBoth - 1,
  NewNumEvens is NumEvens - (1 - (Y rem 2)),
  NewNumOdds is NumOdds - (Y rem 2),
  % format("~d ~d ~d ~d ~d ~d\n", [N, X, Y, NewNumEvens, NewNumOdds, NewNumBoth]),
  opToWithSize(add, Y, Tail, NewNumEvens, NewNumOdds, NewNumBoth).
opToWithSize(mul, 1, [], 0, 0, 0).
opToWithSize(mul, N, [X | Tail], NumEvens, NumOdds, NumBoth) :-
  between(1, N, X),
  Y is N / X,
  integer(Y),
  NewNumBoth is NumBoth - 1,
  NewNumEvens is NumEvens - (1 - (Y rem 2)),
  NewNumOdds is NumOdds - (Y rem 2),
  % format("~d ~d ~d ~d ~d ~d\n", [N, X, Y, NewNumEvens, NewNumOdds, NewNumBoth]),
  opToWithSize(add, Y, Tail, NewNumEvens, NewNumOdds, NewNumBoth).



%Example input: Find a set of 3 odd integers that sum to 15
%Output:3,5,7
%Input: Find a set of 2 even integers that sum to 6

%We want ot break up the sentence "Find a set of 3 odd integers that sum to 15" as:
% sentence("Find a set of") I("3 odd integers") -> I(O("3 odd")) pronoun("that") Op("sum")  preposition("to") number("15")
%sentence broken down with sent_phrase, integer_phrase,pronoun, op,preposition,number

% sentenceWithEven --> sent_phrase,integer_phrase_even,pronoun,op,preposition,number.
% integer_phrase_even --> number, "even", noun, .

%Need to create another sentence phrase for multiply
%Example if we have: sum in our sentence then we will get multiply because it is the first thing in the DCG
% sentenceSum --> sent_phrase,integer_phrase,pronoun,opSum,preposition,sum.
% sentenceMult --> sent_phrase,integer_phrase,pronoun,opMult,preposition,multiply.
% sent_phrase --> verb,article,noun, preposition.
% integer_phrase --> number, int_property, noun.
% integer_phrase --> number, int_property,conjuction,number, int_property,noun.
% pronoun --> ["that"].
% opSum --> ["sum"].
% opMult --> ["multiply"].
% preposition --> ["to"] | ["of"].
% int_property --> ["even"] | ["odd"].
% conjuction  --> ["and"].
% article --> ["a"].
% noun --> ["set"] | ["integers"].
% verb --> ["Find"].
% number --> ["4"];["3"].
% sum --> ["15"].
% multiply --> ["15"].










sent(N) --> verb,size(N).
sentenceSum(N,S) --> sent_phrase,size(N), int_property, noun,pronoun,opSum,preposition,sum(S).
sentenceMult(N,M) --> sent_phrase,size(N), int_property, noun,pronoun,opMult,preposition,multiply(M).
sent_phrase --> verb,article,noun, preposition.
% integer_phrase --> size(N), int_property, noun.
% integer_phrase --> size(N), int_property,conjuction,number, int_property,noun.
pronoun --> ["that"].
opSum --> ["sum"].
opMult --> ["multiply"].
preposition --> ["to"] | ["of"].
int_property --> ["even"] | ["odd"].
conjuction  --> ["and"].
article --> ["a"].
noun --> ["set"] | ["integers"].
verb --> ["Find"].
size(N) -->
  integer(N).
sum(S) -->
  integer(S).
multiply(M) -->
  integer(M).
