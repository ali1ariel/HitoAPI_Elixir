defmodule HitoAPI_Elixir.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :nome, :string
      add :cpf, :string
      add :email, :string
      add :cep, :string
      add :numero, :integer

      timestamps()
    end

  end
end
