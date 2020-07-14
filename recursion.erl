-module(recursion)
-export([fac/1])

fac(0) ->
  1;
fac(X) ->
  X * fac(X-1).