read_number = fn message ->
  input = IO.gets(message) |> String.trim()

  case Integer.parse(input) do
    {number, ""} -> {:ok, number}
    _ -> {:error, "Debes de introducir un número válido"}
  end
end

# Función recursiva para leer un número válido mayor que 0
read_valid_number = fn message, read_fn ->
  case read_fn.(message) do
    {:ok, number} -> number
    {:error, error} ->
      IO.puts("Error: #{error}")
      :error
  end
end

# Uso un módulo para manejar la recursión, ya que las funciones anónimas no pueden llamarse a sí mismas directamente
defmodule Reader do
  def read_valid_number(message) do
    input = IO.gets(message) |> String.trim()

    case Integer.parse(input) do
      {number, ""} when number > 0 ->
        number
      {_number, ""} ->
        IO.puts("Error: El número debe ser mayor que 0")
        read_valid_number(message)
      _ ->
        IO.puts("Error: Debes introducir un número válido")
        read_valid_number(message)
    end
  end

  def read_simple_number(message) do
    input = IO.gets(message) |> String.trim()

    case Integer.parse(input) do
      {number, ""} ->
        number
      _ ->
        IO.puts("Error: Debes introducir un número válido")
        read_simple_number(message)
    end
  end
end

check_parity = fn number ->
  if rem(number, 2) == 0 do
    "#{number} es par"
  else
    "#{number} es impar"
  end
end

# === PROGRAMA PRINCIPAL ===

IO.puts("=== Comprobador de números pares e impares ===\n")

array_length = Reader.read_valid_number("¿Qué tamaño tendrá el array? ")

quantity =
  Stream.repeatedly(fn ->
    Reader.read_valid_number("¿Cuántos números quieres introducir? (máximo #{array_length}) ")
  end)
  |> Enum.find(fn quantity ->
    if quantity > array_length do
      IO.puts("Error: No puedes introducir más de #{array_length} elementos")
      false
    else
      true
    end
  end)

IO.puts("\nIntroduce los #{quantity} números:\n")

numbers = Enum.map(1..quantity, fn i ->
  Reader.read_simple_number("Número #{i}: ")
end)

IO.puts("\n=== Resultados ===\n")
IO.puts("Tamaño del array: #{array_length}")
IO.puts("Elementos introducidos: #{quantity}")
IO.puts("Espacios libres: #{array_length - quantity}\n")

numbers
|> Enum.with_index(1)
|> Enum.each(fn {number, index} ->
  IO.puts("Posición #{index}: #{check_parity.(number)}")
end)
