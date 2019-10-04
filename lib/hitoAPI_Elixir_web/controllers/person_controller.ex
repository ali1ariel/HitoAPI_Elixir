defmodule HitoAPI_ElixirWeb.PersonController do
  use HitoAPI_ElixirWeb, :controller

  alias HitoAPI_Elixir.Directory
  alias HitoAPI_Elixir.Directory.Person

  action_fallback HitoAPI_ElixirWeb.FallbackController

  def index(conn, _params) do
    persons = Directory.list_persons()
    render(conn, "index.json", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    #IO.puts(person_params)
    with {:ok, %Person{} = person} <- Directory.create_person(person_params) do

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.person_path(conn, :show, person))
      |> render("show.json", person: person)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Directory.get_person!(id)
    render(conn, "show.json", person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Directory.get_person!(id)

    with {:ok, %Person{} = person} <- Directory.update_person(person, person_params) do
      render(conn, "show.json", person: person)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Directory.get_person!(id)

    with {:ok, %Person{}} <- Directory.delete_person(person) do
      send_resp(conn, :no_content, "")
    end
  end
end
