defmodule Assembled.Repo do
  use Ecto.Repo,
    otp_app: :assembled,
    adapter: Ecto.Adapters.Postgres
end
