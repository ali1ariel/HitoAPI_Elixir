defmodule HitoAPI_ElixirWeb.PersonController do
  use HitoAPI_ElixirWeb, :controller

  alias HitoAPI_Elixir.Directory
  alias HitoAPI_Elixir.Directory.Person
  import PhoenixSwagger

  action_fallback HitoAPI_ElixirWeb.FallbackController

  def swagger_definitions do
    %{
      Person: swagger_schema do
        title "Person"
        description "A Person of the application"
        properties do
          id :integer, "Unique identifier"
          nome :string, "Users name", required: true
          cpf :string, "User document number", required: true
          cep :string, "User address cep", required: true
          numero :integer, "User address number", required: true
          # preferences (Schema.new do
          #   properties do
          #     subscribe_to_mailing_list :boolean, "mailing list subscription", default: true
          #     send_special_offers :boolean, "special offers list subscription", default: true
          #   end
          # end)
        end
        example %{
          name: "Joe",
          id: 123,
          cep: "83065030",
          cpf: "04325416874",
          numero: "120"
        }
      end,
      Persons: swagger_schema do
        title "Persons"
        description "A collection of Persons"
        type :array
        items Schema.ref(:Person)
      end
    }
  end

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
