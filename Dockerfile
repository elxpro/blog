FROM elixir:alpine

RUN apk add --no-cache build-base git python

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN mix do deps.get, deps.compile

COPY priv priv
COPY lib lib

CMD ["mix", "phx.server"]
