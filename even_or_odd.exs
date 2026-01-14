numbers =  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
obtain_first_ten = Enum.take(numbers,10);

comprobe_even_or_odd = fn number ->
  if rem(number, 2) == 0 do
    "#{number} is even"
  else
    "#{number} is odd"
  end
end

# -----------------------------------------------------------------

IO.puts("Comprobar la paridad de los primeros 10 números: ")

obtain_first_ten |> Enum.each(fn number ->
  IO.puts(comprobe_even_or_odd.(number))
end)
