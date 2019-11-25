
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

sentence --> verb,article,noun.
article --> ["a"].
noun -->["set"].
verb -->["find"].
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

%Example input: Find a set of 3 odd integers that sum to 15
%Output:3,5,7

%We want ot break up the sentence "Find a set of 3 odd integers that sum to 15" as:
% sent("Find a set of") I("3 odd integers") -> I(O("3 odd")) pronoun("that") Op("sum")  prep("to") Number("15")
