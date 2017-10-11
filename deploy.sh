#!/bin/bash

mix ecto.migrate
mix deps.get
mix release.init
env MIX_ENV=prod mix release --env=prod
env MIX_ENV=prod mix phx.digest --env=prod --verbose
env PORT=8000 _build/prod/rel/microblog/bin/microblog start
