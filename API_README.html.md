# API Documentation

  * [HitoAPI_ElixirWeb.PersonController](#hitoapi_elixirweb-personcontroller)
    * [index](#hitoapi_elixirweb-personcontroller-index)
    * [create](#hitoapi_elixirweb-personcontroller-create)
    * [update](#hitoapi_elixirweb-personcontroller-update)
    * [delete](#hitoapi_elixirweb-personcontroller-delete)

## HitoAPI_ElixirWeb.PersonController
### <a id=hitoapi_elixirweb-personcontroller-index></a>index
#### index lists all persons
##### Request
* __Method:__ GET
* __Path:__ /api/persons
* __Request headers:__
```
accept: application/json
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRGxoMrnZYa0AAAeB
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": []
}
```

### <a id=hitoapi_elixirweb-personcontroller-create></a>create
#### create person renders person when data is valid
##### Request
* __Method:__ POST
* __Path:__ /api/persons
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "person": {
    "numero": 42,
    "nome": "some nome",
    "email": "some email",
    "cpf": "some cpf",
    "cep": "some cep"
  }
}
```

##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRG-pW67lB3sAAAgh
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
location: /api/persons/144
```
* __Response body:__
```json
{
  "data": {
    "numero": 42,
    "nome": "some nome",
    "id": 144,
    "email": "some email",
    "cpf": "some cpf",
    "cep": "some cep"
  }
}
```

#### create person renders errors when data is invalid
##### Request
* __Method:__ POST
* __Path:__ /api/persons
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "person": {
    "numero": null,
    "nome": null,
    "email": null,
    "cpf": null,
    "cep": null
  }
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRHCkq_e12_QAAAhB
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "errors": {
    "numero": [
      "can't be blank"
    ],
    "nome": [
      "can't be blank"
    ],
    "email": [
      "can't be blank"
    ],
    "cpf": [
      "can't be blank"
    ],
    "cep": [
      "can't be blank"
    ]
  }
}
```

### <a id=hitoapi_elixirweb-personcontroller-update></a>update
#### update person renders person when data is valid
##### Request
* __Method:__ PUT
* __Path:__ /api/persons/143
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "person": {
    "numero": 43,
    "nome": "some updated nome",
    "email": "some updated email",
    "cpf": "some updated cpf",
    "cep": "some updated cep"
  }
}
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRG7Kxp5ELGIAAAfB
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "numero": 43,
    "nome": "some updated nome",
    "id": 143,
    "email": "some updated email",
    "cpf": "some updated cpf",
    "cep": "some updated cep"
  }
}
```

#### update person renders errors when data is invalid
##### Request
* __Method:__ PUT
* __Path:__ /api/persons/145
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; boundary=plug_conn_test
```
* __Request body:__
```json
{
  "person": {
    "numero": null,
    "nome": null,
    "email": null,
    "cpf": null,
    "cep": null
  }
}
```

##### Response
* __Status__: 422
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRG_sERCxgKQAAAMC
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "errors": {
    "numero": [
      "can't be blank"
    ],
    "nome": [
      "can't be blank"
    ],
    "email": [
      "can't be blank"
    ],
    "cpf": [
      "can't be blank"
    ],
    "cep": [
      "can't be blank"
    ]
  }
}
```

### <a id=hitoapi_elixirweb-personcontroller-delete></a>delete
#### delete person deletes chosen person
##### Request
* __Method:__ DELETE
* __Path:__ /api/persons/146
* __Request headers:__
```
accept: application/json
```

##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: FjdqRHDVd2gr-0cAAAAD
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json

```

