# HitoAPI_Elixir
API de gerenciamento de pessoas, agora em Elixir

## Utilizando

Instale as dependencias utilizando:
```
mix deps.get
```
Verifique se as configurações do Postgres estão condizentes com o arquivo *config/devs.exs*.
Após, rode os comandos:
```
mix ecto.create
mix ecto.migrate
```
Para povoar seu banco de dados, utilize:
```
mix run priv/repo/seeds.exs
```

por fim, rode na sua máquina usando:

```
mix phx.server
```

Para testar use as rotas presentes no comando:
```
mix phx.routes
```

Entradas post precisa de um programa auxiliar, pode ser usado o *Postman* ou o *Insomnia* por exemplo. O padrão de entrada Application/json é assim:
```
{"person":
	{
	    "nome": "susana",
	    "cpf": "08423467975",
	    "email": "almoço@inf.ufsm.br",
	    "cep": "971070",
	    "numero": 1
	}
}
```

## Requisitos

* Elixir
* Erlang
* Postgres
* Postman