%% handle POST and returns JSON
-module(response_handler).

-author('Dan Loaiza <papachan@gmail.com>').

-compile({parse_transform,lager_transform}).

-export(
   [
    init/2,
    content_types_provided/2,
    welcome_page/2,
    getjson_response/2,
    allowed_methods/2,
    terminate/3,
    handle_error/2
   ]).

-define(HEADERS, [{<<"close">>}]).

init(Req, Opts) ->
    {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
    {[
        {<<"text/html">>, welcome_page},
        {<<"application/json">>, getjson_response}
    ], Req, State}.

allowed_methods(Req, State) ->
    {[<<"GET">>,<<"POST">>], Req, State}.

getjson_response(Req, State) ->
    Struct = {[
      {total, 10.5},
      {currency, <<"S./">>},
      {status, <<"OK">>}
    ]},
    Body = jiffy:encode(Struct),
    %lager:warning("reponse json ~p", [Body]),
    lager:warning("State ~p", [State]),
    {Body, Req, State}.

welcome_page(Req, State) ->
    Body = <<"<html>
<head>
    <meta charset=\"utf-8\">
        <title></title>
</head>
<body>
    <h1>An HTTP Rest Service...</h1>
</body>
</html>">>,
    lager:warning("reponse json ~p", [Body]),
    {Body, Req, State}.

handle_error(Req, State) ->
    {ok, Req1} = cowboy_req:reply(503, [], <<>>, Req),
    {ok, Req1, State}.

terminate(_Reason,_Req,_State) ->
    ok.



