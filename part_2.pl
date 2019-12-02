main() :- true.

main(W) :-

  %Parsing input which is a list containg a single string Ex: ["Input goes here"]
  %Converting it to a list of strings. Ex:"["Input", "goes", "here"]"
  atomic_list_concat(W,' ',L),
  atom_string(L,Sent),
  split_string(Sent," "," ",List),

  %If and Else statement. Prints out list if it matches sentence parse else invalid.
  (sentence(List,[]) ->
    print(List),nl
    ; print("This is an invalid string"),nl
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


%Example input: Find a set of 3 odd integers that sum to 15
%Output:3,5,7

%We want ot break up the sentence "Find a set of 3 odd integers that sum to 15" as:
% sentence("Find a set of") I("3 odd integers") -> I(O("3 odd")) pronoun("that") Op("sum")  preposition("to") number("15")
%sentence broken down with sent_phrase, integer_phrase,pronoun, op,preposition,number

% sentenceWithEven --> sent_phrase,integer_phrase_even,pronoun,op,preposition,number.
% integer_phrase_even --> number, "even", noun, .


sentence --> sent_phrase,integer_phrase,pronoun,op,preposition,number.
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
verb --> ["find"].
number --> ["3"] | ["15"] | ["120"].
% naturalNumber(X) --> 
