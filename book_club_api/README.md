# BookClubApi

API REST para gestionar un club de lectura, construida con **Phoenix Framework** y **Elixir**.

## Inicio Rápido

```bash
# Instalar dependencias
mix setup

# Iniciar servidor
mix phx.server

# O dentro de IEx
iex -S mix phx.server
```

La API estará disponible en [`localhost:4000`](http://localhost:4000).

---

## Endpoints Disponibles

| Recurso | Endpoint | Métodos |
|---------|----------|---------|
| Libros | `/api/books` | GET, POST, GET/:id, PUT/:id, DELETE/:id |
| Miembros | `/api/members` | GET, POST, GET/:id, PUT/:id, DELETE/:id |
| Reviews | `/api/reviews` | GET, POST, GET/:id, PUT/:id, DELETE/:id |

---

## Historial de Versiones

### v0.0 - Proyecto Inicial
> *Fecha: Enero 2026*

**Cambios:**
- Proyecto Phoenix creado con `--no-html --no-assets --database sqlite3`
- Recursos generados: Libros, Miembros, Reseñas
- CRUD básico funcionando para los tres modelos
- Base de datos SQLite configurada

**Comandos utilizados:**
```bash
mix phx.new book_club_api --no-html --no-assets --database sqlite3
mix phx.gen.json Books Book books title:string author:string isbn:string description:text published_year:integer
mix phx.gen.json Members Member members name:string email:string joined_at:date
mix phx.gen.json Reviews Review reviews rating:integer comment:text book_id:references:books member_id:references:members
```

---

### v0.1 - Validaciones
> *Fecha: Enero 2026*

**Cambios:**
- Añadidas validaciones robustas a todos los esquemas
- Creados índices únicos en la base de datos
- Validaciones personalizadas para ISBN, email y puntuación

**Validaciones por modelo:**

| Modelo | Validaciones |
|--------|--------------|
| **Book** | título/autor requeridos, formato ISBN 10/13 dígitos, ISBN único, año entre 1450-actual |
| **Member** | nombre/email requeridos, formato de email válido, email único, fecha no futura |
| **Review** | puntuación 0-10, book_id/member_id requeridos, una reseña por libro/miembro |

---

### v0.2 - Relaciones entre Modelos
> *Fecha: Enero 2026*

**Cambios:**
- Configuradas las relaciones entre `Book`, `Member` y `Review`
- `Review` ahora incluye datos del libro y miembro en las respuestas JSON
- Añadido `preload` en el contexto de Reviews

**Relaciones:**
```
┌──────────┐       1:N       ┌──────────┐       N:1       ┌──────────┐
│   Book   │────────────────►│  Review  │◄────────────────│  Member  │
└──────────┘                 └──────────┘                 └──────────┘
     │                             │                            │
     │  has_many :reviews          │  belongs_to :book          │  has_many :reviews
     │                             │  belongs_to :member        │
```

- `Book` → `has_many :reviews`
- `Member` → `has_many :reviews`
- `Review` → `belongs_to :book` + `belongs_to :member`

**Ejemplo de respuesta:**
```json
{
  "data": {
    "id": "uuid",
    "rating": 5,
    "comment": "¡Excelente libro!",
    "book": { "id": "uuid", "title": "1984", "author": "George Orwell" },
    "member": { "id": "uuid", "name": "Juan García" }
  }
}
```

---

## Hoja de Ruta

- [x] **v0.0** - Proyecto inicial con CRUD básico
- [x] **v0.1** - Validaciones
- [x] **v0.2** - Relaciones entre modelos
- [ ] **v0.3** - Autenticación (JWT)
- [ ] **v0.4** - Filtros y búsqueda
- [ ] **v0.5** - Paginación
- [ ] **v0.6** - Tests completos
- [ ] **v1.0** - Listo para producción

---

## Stack Tecnológico

- **Elixir** 1.14+
- **Phoenix Framework** 1.7+
- **Ecto** (ORM)
- **SQLite3** (Base de datos)

---

## Recursos

- [Phoenix Framework](https://www.phoenixframework.org/)
- [Guías de Phoenix](https://hexdocs.pm/phoenix/overview.html)
- [Documentación](https://hexdocs.pm/phoenix)
- [Foro de Elixir](https://elixirforum.com/c/phoenix-forum)
- [Proyecto original: ElixirLand Book Club API](https://github.com/elixirland/xlp-book-club-API)
