-module(recursion).
-export([fac/1,testFac/0]).

fac(0) ->
  1;
fac(X) ->
  X * fac(X-1).

testFac()->
  fac(5) == 120.