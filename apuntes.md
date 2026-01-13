# Apuntes de Elixir: Fundamentos y Conceptos

## 1. Introducción y Contexto

**Elixir** es un lenguaje de programación funcional y dinámico diseñado para construir aplicaciones escalables y mantenibles.

### Historia
* **Creador:** José Valim (ex-core contributor de Ruby on Rails).
* **Año:** 2011.
* **Motivación:** Combinar la productividad de Ruby con la robustez de la Máquina Virtual de Erlang (BEAM).

### ¿Por qué Elixir?
1.  **Erlang VM (BEAM):** Corre sobre una máquina virtual probada durante décadas en sistemas de telecomunicaciones (WhatsApp y Discord la usan).
2.  **Concurrencia Masiva:** Usa el modelo de actores. Procesos ligeros aislados que se comunican por mensajes.
3.  **Tolerancia a Fallos:** Filosofía *"Let it crash"*. Si un proceso falla, un supervisor lo reinicia sin afectar al resto del sistema.

---

## 2. Instalación

### Herramientas Necesarias
* **Erlang/OTP:** La base sobre la que corre Elixir.
* **Elixir:** El lenguaje en sí.

### Métodos por Sistema Operativo
* **macOS:**
    * `brew install elixir` (o vía `asdf`).
* **Linux:**
    * `sudo apt install elixir` (aunque se recomienda usar `asdf`).
* **Windows:**
    * Descargar el instalador web oficial o usar WSL2.

> **Recomendación Pro:** Usar un gestor de versiones como **asdf** para manejar múltiples versiones de Erlang y Elixir fácilmente.

---

## 3. Tooling (Herramientas de CLI)

Al instalar Elixir, obtienes tres comandos esenciales:

* **`iex` (Interactive Elixir):** La consola interactiva (REPL).
    * Salir: `Ctrl+C` dos veces.
* **`mix`:** La navaja suiza. Compila, crea proyectos y corre tests.
    * `mix new nombre_proyecto`: Crea un proyecto nuevo.
    * `mix test`: Corre las pruebas.
* **`hex`:** El gestor de paquetes (repositorio de librerías).

---
