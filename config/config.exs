# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hitoAPI_Elixir,
  ecto_repos: [HitoAPI_Elixir.Repo]

# Configures the endpoint
config :hitoAPI_Elixir, HitoAPI_ElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GqRCx6464IaBfxqfRrDrjCgaVK0TnYROUGP11B1j+0WkY8NQHokkPUHaEy9QoEeP",
  render_errors: [view: HitoAPI_ElixirWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HitoAPI_Elixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
