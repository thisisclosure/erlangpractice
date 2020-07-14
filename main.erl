-module(main).
-export([double/1,area/3,start/0]).

mult(X,Y) ->
  X*Y.

double(X)->
  mult(2,X).

area(A,B,C) ->
  S = (A +B +C)/2,

  math:sqrt(S*(S-A )*(S-B)*(S-C)). 

start() ->
  io:fwrite("hello world\n").
