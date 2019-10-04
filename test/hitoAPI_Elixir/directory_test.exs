defmodule HitoAPI_Elixir.DirectoryTest do
  use HitoAPI_Elixir.DataCase

  alias HitoAPI_Elixir.Directory

  describe "persons" do
    alias HitoAPI_Elixir.Directory.Person

    @valid_attrs %{cep: "some cep", cpf: "some cpf", email: "some email", nome: "some nome", numero: 42}
    @update_attrs %{cep: "some updated cep", cpf: "some updated cpf", email: "some updated email", nome: "some updated nome", numero: 43}
    @invalid_attrs %{cep: nil, cpf: nil, email: nil, nome: nil, numero: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Directory.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Directory.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Directory.create_person(@valid_attrs)
      assert person.cep == "some cep"
      assert person.cpf == "some cpf"
      assert person.email == "some email"
      assert person.nome == "some nome"
      assert person.numero == 42
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Directory.update_person(person, @update_attrs)
      assert person.cep == "some updated cep"
      assert person.cpf == "some updated cpf"
      assert person.email == "some updated email"
      assert person.nome == "some updated nome"
      assert person.numero == 43
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_person(person, @invalid_attrs)
      assert person == Directory.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Directory.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Directory.change_person(person)
    end
  end
end
