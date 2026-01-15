defmodule Calculator do
  def run do
    IO.puts("************ Calculadora Elixir ************\n")
    num1 = read_number("Primer número: ")
    op = IO.gets("Operación (+, -, *, /): ") |> String.trim()
    num2 = read_number("Segundo número: ")

    result = calculate(num1, op, num2)
    IO.puts("Resultado: #{result}\n")
  end

  def calculate(a, "+", b), do: a + b
  def calculate(a, "-", b), do: a - b
  def calculate(a, "*", b), do: a * b
  def calculate(_, "/", 0), do: "Error: No se puede dividir por cero"
  def calculate(a, "/", b), do: a / b
  def calculate(_, op, _), do: "Error: Operación '#{op}' no válida"

  def read_number(message) do
    input = IO.gets(message) |> String.trim()
    case Float.parse(input) do
      {number, ""} ->
        number
      _ ->
        case Integer.parse(input) do
          {number, ""} ->
            number
          _ ->
            IO.puts("Error: Debes introducir un número válido")
            read_number(message)
        end
    end
  end
end

Calculator.run()
