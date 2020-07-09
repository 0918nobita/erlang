-module(hello).
-export([hello/0]).

% Hello World を出力
hello() ->
  io:put_chars("Hello, world!\n").
