# BookClubApi

REST API to manage a book club, built with **Phoenix Framework** and **Elixir**.

## Quick Start

```bash
# Install dependencies
mix setup

# Start server
mix phx.server

# Or inside IEx
iex -S mix phx.server
```

API will be available at [`localhost:4000`](http://localhost:4000).

---

## Available Endpoints

| Resource | Endpoint | Methods |
|----------|----------|---------|
| Books | `/api/books` | GET, POST, GET/:id, PUT/:id, DELETE/:id |
| Members | `/api/members` | GET, POST, GET/:id, PUT/:id, DELETE/:id |
| Reviews | `/api/reviews` | GET, POST, GET/:id, PUT/:id, DELETE/:id |

---

## Version History

### v0.0 - Initial Project
> *Date: January 2026*

**Changes:**
- Phoenix project created with `--no-html --no-assets --database sqlite3`
- Generated resources: Books, Members, Reviews
- Basic CRUD working for all three models
- SQLite database configured

**Commands used:**
```bash
mix phx.new book_club_api --no-html --no-assets --database sqlite3
mix phx.gen.json Books Book books title:string author:string isbn:string description:text published_year:integer
mix phx.gen.json Members Member members name:string email:string joined_at:date
mix phx.gen.json Reviews Review reviews rating:integer comment:text book_id:references:books member_id:references:members
```

---

### v0.1 - Validations
> *Date: January 2026*

**Changes:**
- Added robust validations to all schemas
- Created unique indexes in the database
- Custom validations for ISBN, email and rating

**Validations by model:**

| Model | Validations |
|-------|-------------|
| **Book** | title/author required, ISBN format 10/13 digits, unique ISBN, year between 1450-current |
| **Member** | name/email required, valid email format, unique email, date not in future |
| **Review** | rating 1-5 stars, book_id/member_id required, one review per book/member |

---

### v0.2 - Model Relationships
> *Date: January 2026*

**Changes:**
- Configured relationships between `Book`, `Member` and `Review`
- `Review` now includes book and member data in JSON responses
- Added `preload` in Reviews context

**Relationships:**
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

**Response example:**
```json
{
  "data": {
    "id": "uuid",
    "rating": 5,
    "comment": "Excellent book!",
    "book": { "id": "uuid", "title": "1984", "author": "George Orwell" },
    "member": { "id": "uuid", "name": "John Smith" }
  }
}
```

---

## Roadmap

- [x] **v0.0** - Initial project with basic CRUD
- [x] **v0.1** - Validations
- [x] **v0.2** - Model relationships
- [ ] **v0.3** - Authentication (JWT)
- [ ] **v0.4** - Filters and search
- [ ] **v0.5** - Pagination
- [ ] **v0.6** - Complete tests
- [ ] **v1.0** - Production ready

---

## Tech Stack

- **Elixir** 1.14+
- **Phoenix Framework** 1.7+
- **Ecto** (ORM)
- **SQLite3** (Database)

---

## Resources

- [Phoenix Framework](https://www.phoenixframework.org/)
- [Phoenix Guides](https://hexdocs.pm/phoenix/overview.html)
- [Documentation](https://hexdocs.pm/phoenix)
- [Elixir Forum](https://elixirforum.com/c/phoenix-forum)
- [Original project: ElixirLand Book Club API](https://github.com/elixirland/xlp-book-club-API)
