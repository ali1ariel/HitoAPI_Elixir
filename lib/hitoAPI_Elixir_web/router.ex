defmodule HitoAPI_ElixirWeb.Router do
  use HitoAPI_ElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HitoAPI_ElixirWeb do
    pipe_through :api
    resources "/persons", PersonController
  end
end
