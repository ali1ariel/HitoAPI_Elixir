defmodule HitoAPI_Elixir.Repo do
  use Ecto.Repo,
    otp_app: :hitoAPI_Elixir,
    adapter: Ecto.Adapters.Postgres
end
