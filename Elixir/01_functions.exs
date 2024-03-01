# Simple functions in Elixir
#
# Gilberto Echeverria
# 2024-02-27

defmodule Basics do

  def suma(a, b) do
    a + b
  end

  def c_to_f(temp) do
    temp * 9 / 5 + 32
  end

  def f_to_c(temp) do
    (temp - 32) * 5 / 9
  end

  def sign(num) do
    cond do
      num > 0 -> 1
      num < 0 -> -1
      true -> 0
    end
  end

end

IO.puts "Hello there"
IO.puts Basics.suma 4, 2

IO.puts(Basics.c_to_f(-40))
IO.puts(Basics.f_to_c(128))

IO.puts(Basics.f_to_c(Basics.c_to_f(36.4)))

# Pipe operator
# Take the previous result as the first argument of a function
IO.gets("Enter a number: ")
|> String.trim()
|> String.to_float()
|> Basics.c_to_f()
|> Basics.f_to_c()
|> Basics.suma(300)
|> IO.puts()
