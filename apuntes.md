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
