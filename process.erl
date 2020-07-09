-module(process).
-export([child/0, parent/0]).

child() ->
    receive
        foo ->
            io:put_chars("foo!\n");
        bar ->
            io:put_chars("bar!\n");
        _ ->
            io:put_chars("huh?\n")
    end.

parent() ->
    Process1 = spawn(process, child, []),
    Process1 ! foo,
    Process1 ! bar,
    Process2 = spawn(process, child, []),
    Process2 ! bar,
    spawn(process, child, []) ! 42,
    done.
