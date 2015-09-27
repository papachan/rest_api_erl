PROJECT = rest_api

DEPS = cowboy lager epgsql jiffy
dep_cowboy = git https://github.com/ninenines/cowboy master
dep_lager = git https://github.com/basho/lager.git master
dep_epgsql = git https://github.com/epgsql/epgsql.git master
dep_jiffy = git https://github.com/davisp/jiffy.git master

include erlang.mk
