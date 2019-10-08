defmodule HitoAPI_Elixir.Directory.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :cep, :string, null: false
    field :cpf, :string, null: false
    field :email, :string, null: false
    field :nome, :string, null: false
    field :numero, :integer, null: false

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:nome, :cpf, :email, :cep, :numero])
    |> validate_required([:nome, :cpf, :email, :cep, :numero])
  end
end
