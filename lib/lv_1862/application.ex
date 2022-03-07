defmodule Lv1862.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Lv1862Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lv1862.PubSub},
      # Start the Endpoint (http/https)
      Lv1862Web.Endpoint
      # Start a worker by calling: Lv1862.Worker.start_link(arg)
      # {Lv1862.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lv1862.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Lv1862Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
