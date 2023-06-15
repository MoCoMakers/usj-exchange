FROM elixir
RUN apt update
RUN apt install -y inotify-tools libtool automake libgmp-dev make libwxgtk-webview3.0-gtk3-dev libssl-dev libncurses5-dev curl git
ADD ./mix.exs ./mix.lock /program/
WORKDIR /program
RUN mix local.hex --force
# RUN mix local.rebar --force
RUN mix deps.get --force
RUN mix deps.compile --force
