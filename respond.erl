-module(respond).
-export([child/0, parent/0]).

child() ->
    receive
        {From, hello} ->
            From ! "Hello!",
            child();
        {From, hi} ->
            From ! "Hi!",
            child();
        {From, _} ->
            From ! "Huh?",
            child()
    end.

parent() ->
    Self = self(),
    Process = spawn(respond, child, []),
    Process ! {Self, hello},
    Process ! {Self, hi},
    Process ! {Self, 500},
    Process.
