use Mix.Config

# Configure your database
config :hitoAPI_Elixir, HitoAPI_Elixir.Repo,
  username: "postgres",
  password: "postgres",
  database: "hitoapi_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hitoAPI_Elixir, HitoAPI_ElixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
