defmodule HitoAPI_ElixirWeb.PersonView do
  use HitoAPI_ElixirWeb, :view
  alias HitoAPI_ElixirWeb.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      nome: person.nome,
      cpf: person.cpf,
      email: person.email,
      cep: person.cep,
      numero: person.numero}
  end
end
