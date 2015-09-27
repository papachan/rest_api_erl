-module(rest_api).

-author('Dan Loaiza <papachan@gmail.com>').

-behaviour(application).


-export([start/2, stop/1]).


%% application
%% @doc Starts the application
start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", response_handler, []},
            {"/city/lima", response_handler, []},
            {"/error", response_hanlder, []}
            
        ]}
    ]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
        {env, [{dispatch, Dispatch}]}
    ]),
    rest_api_sup:start_link().

%% private
stop(_State) ->
    ok.


