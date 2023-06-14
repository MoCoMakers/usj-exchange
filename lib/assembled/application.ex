defmodule Assembled.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AssembledWeb.Telemetry,
      # Start the Ecto repository
      Assembled.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Assembled.PubSub},
      # Start Finch
      {Finch, name: Assembled.Finch},
      # Start the Endpoint (http/https)
      AssembledWeb.Endpoint
      # Start a worker by calling: Assembled.Worker.start_link(arg)
      # {Assembled.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Assembled.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AssembledWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
