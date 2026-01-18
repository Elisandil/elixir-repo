# Elixir Learning Repository

Repositorio de aprendizaje de **Elixir** — un lenguaje de programación funcional, dinámico y concurrente que corre sobre la máquina virtual de Erlang (BEAM).

## Contenido del Repositorio

Este repositorio contiene:

### Apuntes Teóricos
  - [apuntes.md](apuntes.md) — Guía completa de fundamentos de Elixir incluyendo:
  - Historia y motivación del lenguaje
  - Instalación y herramientas (iex, mix, hex)
  - Inmutabilidad y el operador pipe (`|>`)
  - Pattern matching
  - Tipos de datos básicos
  - Estructuras de control
  - Listas, Enumerables y Recursión

### Scripts de Práctica

| Script | Descripción |
|--------|-------------|
| [hola.exs](hola.exs) | Primer programa: entrada/salida básica |
| [even_or_odd.exs](even_or_odd.exs) | Determina si los números son pares o impares |
| [even_or_odd_improved.exs](even_or_odd_improved.exs) | Versión mejorada del script anterior |
| [calculator.exs](calculator.exs) | Calculadora interactiva con operaciones básicas (+, -, *, /) |
| [guessing_game.exs](guessing_game.exs) | Juego de adivinar un número del 1 al 100 |

### Book Club API

Este proyecto está basado en el ejercicio propuesto por [Elixirland: Book Club API](https://github.com/elixirland/xlp-book-club-API), un reto diseñado para aprender a construir APIs REST con Phoenix Framework.

La API permite gestionar un club de lectura con tres entidades principales: libros, miembros y reviews. Cada libro tiene un título, autor, ISBN, descripción y año de publicación. Los miembros cuentan con nombre, email y fecha de ingreso al club. Las reviews conectan a un miembro con un libro, incluyendo una puntuación del 0 al 10 y un comentario opcional.

Actualmente me encuentro desarrollando este proyecto y he ido añadiendo algunas modificaciones sobre la propuesta original. Una de las decisiones que he tomado ha sido utilizar SQLite como base de datos embebida en lugar de PostgreSQL, lo cual simplifica la configuración del entorno de desarrollo y evita tener que gestionar un servidor de base de datos externo.

Además, he implementado validaciones personalizadas en los esquemas, como la verificación del formato del ISBN, la validación del rango de puntuación en las reseñas, y restricciones para evitar que un mismo miembro pueda dejar más de una reseña por libro.

El proyecto sigue en desarrollo y continuaré añadiendo mejoras conforme avance en mi aprendizaje de Elixir y Phoenix.

## Recursos de Aprendizaje

- [Documentación oficial de Elixir](https://elixir-lang.org/docs.html)
- [Phoenix Framework](https://www.phoenixframework.org/)

---

Proyecto de aprendizaje personal.