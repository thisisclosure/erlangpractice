-module(recursion).
-export([fac/1,fac2/1,fib/1,test/0, sum/1, pieces/1, perfect/1,perfect/3]).

fac(0) ->
  1;
fac(X) ->
  X * fac(X-1).

fac2(0)->
  1;
fac2(N) when N > 0->
  facR(N,1).

facR(0,Acc) ->
  Acc;
facR(N,Acc) when N>0->
  facR(N-1,Acc*N).

fib(0)->
  0;
fib(1)->
  1;
fib(N) when N > 1->
  fib(N-1,0,1).

fib(1,Prev,Acc)->
  Prev+Acc;
fib(N,Prev,Acc) when N>1 ->
  fib(N-1,Acc,Prev+Acc).

pieces(0)->
  1;
pieces(1)->
  2;
pieces(N) when N > 1 ->
  %2*N + sum(N-2).
  pieces(N,N,-1*(N+N-1)).

sum(0)->
  0;
sum(N)->
  sum(N,0).

sum(0,Acc)->
  Acc;
sum(N,Acc) when N > 0 ->
  sum(N-1, N+Acc).
  
pieces(0,OldN,Acc)->
  (2*OldN) + Acc;
pieces(N,OldN,Acc)->
  pieces(N-1,OldN,N+Acc).
 %piecesR(N-1,Acc,(2*N)+ ( ((Prev)+(Acc)) /2) ).

perfect(0)->
  false;
perfect(1)->
  true;
perfect(N)->
  perfect(N,N,0).

perfect(0,N,N)->
  true;
perfect(0,_X,_Y)->
  false;
perfect(N,Old,Acc) when (Old rem (Old-N)) == 0 ->
  perfect(N-1,Old,Acc+(Old-N));
perfect(N,Old,Acc)->
  perfect(N-1,Old,Acc).

%testFac(facFn)->
%  F = facFn,
%  F(5) == 120.

test()->
  (fac2(5) == 120)
  and
  (fib(4) == 4)
  and
  (pieces(5) == 16)
  and
  perfect(1) and perfect(6) and (not perfect(7)).
  %testFac(fac) and testFac(fac2).
