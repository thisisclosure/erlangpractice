-module(recursion).
-export([fac/1,fac2/1,test/0]).

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



%testFac(facFn)->
%  F = facFn,
%  F(5) == 120.

test()->
  fac2(5) == 120.
  %testFac(fac) and testFac(fac2).

