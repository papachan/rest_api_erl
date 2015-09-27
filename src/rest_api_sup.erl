-module(rest_api_sup).

-author('Dan Loaiza <papachan@gmail.com>').

-behaviour(supervisor).

%% API.
-export([start_link/0]).

%% supervisor.
-export([init/1]).

%% API.

-spec start_link() -> {ok, pid()}.
start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% supervisor.

init([]) ->
        lager:start(),
	Procs = [],
	{ok, {{one_for_one, 10, 10}, Procs}}.
