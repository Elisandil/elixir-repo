defmodule GuessingGame do
  def play do
    IO.puts("\n === ADIVINA EL NÚMERO === \n")
    secret = :rand.uniform(100)
    IO.puts("He pensado un número del 1 al 100. ¡Intenta adivinarlo!")
    guess_loop(secret, 1)
  end

  defp guess_loop(secret, attempts) do
    guess = read_number("\nTu intento: ")

    cond do
      guess == secret ->
        IO.puts("\n¡Correcto! Lo lograste en #{attempts} intento(s)")
      guess < secret ->
        IO.puts("Más alto...")
        guess_loop(secret, attempts + 1)
      guess > secret ->
        IO.puts("Más bajo...")
        guess_loop(secret, attempts + 1)
    end
  end

  defp read_number(message) do
    input = IO.gets(message) |> String.trim()

    case Integer.parse(input) do
      {number, ""} when number >= 1 and number <= 100 ->
        number
      {_number, ""} ->
        IO.puts("El número debe estar entre 1 y 100")
        read_number(message)
      _ ->
        IO.puts("Debes introducir un número válido")
        read_number(message)
    end
  end
end

GuessingGame.play()
