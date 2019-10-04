defmodule HitoAPI_Elixir.Directory.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :nome, :string
    field :numero, :integer

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:nome, :cpf, :email, :cep, :numero])
    |> validate_required([:nome, :cpf, :email, :cep, :numero])
  end
end
