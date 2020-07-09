-module(tuple).
-export([myfst/1, mysnd/1]).

myfst({X, _}) -> X.

mysnd({_, Y}) -> Y.
