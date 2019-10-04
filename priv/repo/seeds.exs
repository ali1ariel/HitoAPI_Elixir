# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HitoAPI_Elixir.Repo.insert!(%HitoAPI_Elixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HitoAPI_Elixir.Repo
alias HitoAPI_Elixir.Directory.Person
Repo.insert! %Person{nome: "Alisson", cpf: "08424727975", email: "aamado@inf.ufsm.br", cep: "97105970", numero: 1000}
Repo.insert! %Person{nome: "Alisson", cpf: "08235451975", email: "aa@inf.ufsm.br", cep: "93456670", numero: 562}
Repo.insert! %Person{nome: "Alisson", cpf: "08424353275", email: "aamachado@ism.br", cep: "97112370", numero: 235}