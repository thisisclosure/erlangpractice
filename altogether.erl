-module(altogether).
-export([perimeter/1,area/1,enclose/1,bits/1,test/0]).

hypotenuse(A,B) ->
  math:sqrt(first:square(A) + first:square(B)).

%area of a right triangle
area([triangle,A,B]) ->
  (A *B)/2.
%perimeter expects shapes as a list
%first argument as atomic shape name or just sides
perimeter([circle|R])->
  2*math:pi()*hd(R);
perimeter([square|L])->
  hd(L)*hd(L);
perimeter([triangle,A,B])->
  A + B + hypotenuse(A,B);
perimeter([Shape|Sides]) when is_atom(Shape)->
  perimeter(Sides);
perimeter(Sides)->
  perimeter(Sides,0).

perimeter([],Acc)->
  Acc;
perimeter([X|Xs],Acc) when is_number(X)->
  perimeter(Xs,X+Acc).

%enclose expects a list of points (2-tuples).An optional atomic name can be provided at the head of the list.
enclose([Shape|Points]) when is_atom(Shape)->
  enclose(Points);
enclose(Points)->
  enclose(Points,50000,50000,0,0).

enclose([],MinX,MinY,MaxX,MaxY)->
  {rectangle,MinX,MinY,MaxX,MaxY};
enclose([{X,Y}|Points],MinX,MinY,MaxX,MaxY) when X > MaxX ->
  enclose([{X,Y}|Points],MinX,MinY,X,MaxY);
enclose([{X,Y}|Points],MinX,MinY,MaxX,MaxY) when X < MinX ->
  enclose([{X,Y}|Points],X,MinY,MaxX,MaxY);
enclose([{X,Y}|Points],MinX,MinY,MaxX,MaxY) when Y > MaxY ->
  enclose([{X,Y}|Points],MinX,MinY,MaxX,Y);
enclose([{X,Y}|Points],MinX,MinY,MaxX,MaxY) when Y < MinY ->
  enclose([{X,Y}|Points],MinX,Y,MaxX,MaxY);
enclose([_|Points],MinX,MinY,MaxX,MaxY) ->
  enclose(Points,MinX,MinY,MaxX,MaxY).

%counts the number of 1 bits in N as decimal
bits(N)->
  bits(N,0).

bits(0,Acc)->
  Acc;
bits(N,Acc)->
  bits(N div 2, Acc + (N rem 2)).

test()->
  (bits(7) == 3)
  and
  (perimeter([circle,(1/2)]) == math:pi())
  and
  (perimeter([triangle,3,4]) == 12)
  and
  (enclose([polygon,{1,2},{2,4},{4,6},{6,8},{8,10},{1,12},{8,2}]) == {rectangle,1,2,8,12}).
 
