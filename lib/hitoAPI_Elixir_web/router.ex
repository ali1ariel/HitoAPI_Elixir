defmodule HitoAPI_ElixirWeb.Router do
  use HitoAPI_ElixirWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", HitoAPI_ElixirWeb do
    pipe_through :api
    resources "/persons", PersonController
    options "/persons/:id", PersonController, :options
    options "/persons", PersonController, :options
  end

  def swagger_info do
    %{
      basePath: "/api",
      info: %{
        version: "1.0",
        title: "HitoAPI Elixir"
      },
      tags: [%{name: "Persons", description: "Operations about Users"}]
    }
  end
end
