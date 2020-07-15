-module(lists).
-export([product/1,maximum/1,test/0]).

product(X)->
  product(X,1).

product([],Acc)->
  Acc;
product([X|Xs],Acc) when is_number(X)->
  product(Xs,Acc*X).

maximum(X)->
  product(X,0).

maximum([],Max)->
  Max;
maximum([X|Xs],Max) when X > Max ->
  maximum(Xs,X);
maximum([_X|Xs],Max) ->
  maximum(Xs,Max).

test()->
  L = [1,2,5,4,3],
  (product(L) == 120)
  and
  (maximum(L) == 5)
 .