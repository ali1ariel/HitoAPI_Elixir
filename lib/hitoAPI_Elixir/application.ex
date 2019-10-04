defmodule HitoAPI_Elixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      HitoAPI_Elixir.Repo,
      # Start the endpoint when the application starts
      HitoAPI_ElixirWeb.Endpoint
      # Starts a worker by calling: HitoAPI_Elixir.Worker.start_link(arg)
      # {HitoAPI_Elixir.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HitoAPI_Elixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HitoAPI_ElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
