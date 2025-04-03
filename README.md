# CarChallenge API

API REST en Ruby on Rails con autenticación mediante JWT. Permite a usuarios registrarse, iniciar sesión, ver autos, y marcarlos como favoritos.

---

## Requisitos
- Rails 8.0.2
- Ruby 3.4.2

## Instalación

1. Cloná el repositorio:

```bash
git clone https://github.com/zecee/car_challenge.git
cd car_challenge
```

## Instalar dependencias:
```bash
bundle install
```
## Crear y setear la base de datos:
```bash
bin/rails db:setup
```

## Levantar el servidor:

```bash
rails server
```

La API estará disponible en http://localhost:3000.


## Endpoints y ejemplos con curl
### Registro de usuario
```bash
curl -X POST http://localhost:3000/api/v1/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"123456","password_confirmation":"123456"}'
```


### Login
```bash
curl -X POST http://localhost:3000/api/v1/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"123456"}'
```
Respuesta esperada:

```json
{
  "user": {
    "id": 1,
    "email": "test@example.com"
  },
  "token": "JWT_TOKEN_AQUI"
}
```

## Autos
### Obtener todos los autos (requiere token)
```bash
curl -X GET http://localhost:3000/api/v1/cars \
  -H "Authorization: Bearer JWT_TOKEN_AQUI"

```
### Filtrar por marca
```bash
curl -X GET "http://localhost:3000/api/v1/cars?brand=Toyota" \
  -H "Authorization: Bearer JWT_TOKEN_AQUI"
```

## Favoritos
### Agregar a favoritos
```bash
curl -X POST http://localhost:3000/api/v1/favorites \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer JWT_TOKEN_AQUI" \
  -d '{"car_id": 1}'

```


### Ver favoritos
```bash
curl -X GET http://localhost:3000/api/v1/favorites \
  -H "Authorization: Bearer JWT_TOKEN_AQUI"
```

### Eliminar Favoritos
```bash
curl -X DELETE http://localhost:3000/api/v1/favorites/1 \
  -H "Authorization: Bearer JWT_TOKEN_AQUI"
```
