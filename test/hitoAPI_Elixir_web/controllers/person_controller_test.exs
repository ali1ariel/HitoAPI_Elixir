defmodule HitoAPI_ElixirWeb.PersonControllerTest do
  use HitoAPI_ElixirWeb.ConnCase

  alias HitoAPI_Elixir.Directory
  alias HitoAPI_Elixir.Directory.Person

  @create_attrs %{
    cep: "some cep",
    cpf: "some cpf",
    email: "some email",
    nome: "some nome",
    numero: 42
  }
  @update_attrs %{
    cep: "some updated cep",
    cpf: "some updated cpf",
    email: "some updated email",
    nome: "some updated nome",
    numero: 43
  }
  @invalid_attrs %{cep: nil, cpf: nil, email: nil, nome: nil, numero: nil}

  def fixture(:person) do
    {:ok, person} = Directory.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn =
        conn
        |> get(Routes.person_path(conn, :index))
        |> doc(description: "List all users", operation_id: "list_persons")
        assert json_response(conn, 200)["data"]
      end
  end

  # describe "create person" do
  #   test "renders person when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.person_path(conn, :create), person: @create_attrs)
  #     |> doc(operation_id: "create_user")
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.person_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "cep" => "some cep",
  #              "cpf" => "some cpf",
  #              "email" => "some email",
  #              "nome" => "some nome",
  #              "numero" => 42
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.person_path(conn, :create), person: @invalid_attrs)
  #     |> doc(operation_id: "create_invalid_user")
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update person" do
  #   setup [:create_person]

  #   test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
  #     conn = put(conn, Routes.person_path(conn, :update, person), person: @update_attrs)
  #     |> doc(operation_id: "update_user")
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.person_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "cep" => "some updated cep",
  #              "cpf" => "some updated cpf",
  #              "email" => "some updated email",
  #              "nome" => "some updated nome",
  #              "numero" => 43
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, person: person} do
  #     conn = put(conn, Routes.person_path(conn, :update, person), person: @invalid_attrs)
  #     |> doc(operation_id: "update_invalid_user")
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete person" do
  #   setup [:create_person]

  #   test "deletes chosen person", %{conn: conn, person: person} do
  #     conn = delete(conn, Routes.person_path(conn, :delete, person))
  #     |> doc(operation_id: "delete_user")
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.person_path(conn, :show, person))
  #       |> doc
  #     end
  #   end
  # end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
