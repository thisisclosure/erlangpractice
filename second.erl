-module(second).
-export([hypotenuse/2,perimeter/2,area/2,xOr/2,xxOr/2, x3Or/2,max3/3,howManyEqual/3]).

hypotenuse(A,B) ->
  math:sqrt(first:square(A) + first:square(B)).

perimeter(A,B) ->
  A + B + hypotenuse(A,B).

area(A,B) ->
  (A *B)/2.

is_zero(0)->
  true;
is_zero(_) ->
  false.

xOr(true,false) ->
  true;
xOr(false,true) ->
  true;
xOr(X,X) ->
  false.


xxOr(X,X) ->
  false;
xxOr(_,_) ->
  true.

x3Or(X=Y,Y=X)->
  false;
x3Or(_,_)->
  true.

x4Or(X,Y) ->
  not (X == Y).

x5Or(X,Y) ->
  (X and not Y) or (Y and not X).

nand(X,X) ->
  not (X);
nand(X,Y) ->
  not (X and Y).

X6Or(X,Y) ->
  nand(nand(nand(),nand())).

max3(A,B,C)->
  max(max(A,B),C).

howManyEqual(A,A,A) ->
  3;
howManyEqual(A,A,_) ->
  2;
howManyEqual(A,_,A) ->
  2;
howManyEqual(_,A,A) ->
  2;
howManyEqual(_,_,_) ->
  0.