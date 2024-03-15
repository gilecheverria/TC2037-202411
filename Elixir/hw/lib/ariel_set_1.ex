# Solutions to the exercises proposed by professor Ariel Ortiz
#
# Gilberto Echeverria
# 2022-03-01

defmodule Hw.Ariel1 do
  @moduledoc """
  Implementation of several functions to practice Functional Programming
  """

  # Functions

  @doc """
  Convert temperatures from degrees Fahrenheit to Celsius
  """
  def fahrenheit_to_celsius(far),
    do: (far - 32) / 1.8

  @doc """
  Compute the positive root of a quadratic equation
  """
  def roots(a, b, c),
    do: (-b + :math.sqrt(b * b - 4 * a * c)) / (2 * a)

  # Conditions

  @doc """
  Identify the sign of a number
  """
  def sign(number) do
    cond do
      number == 0 -> 0
      number < 0 -> -1
      number > 0 -> 1
    end
  end

  @doc """
  Identify the weight ratio by Body Mass Index
  """
  def bmi(weight, height) do
    bmi_value = weight / (height * height)

    cond do
      bmi_value < 20 -> :underweight
      bmi_value < 25 -> :normal
      bmi_value < 30 -> :obese1
      bmi_value < 40 -> :obese2
      true -> :obese3
    end
  end

  # Recursion

  @doc """
  Compute the factorial of a number
  """
  def factorial(n), do: do_fact(n, 1)
  defp do_fact(0, a), do: a
  defp do_fact(n, a), do: do_fact(n - 1, n * a)

  @doc """
  Elevate a number to a power
  """
  def pow(0, _p), do: 0
  def pow(n, p), do: do_pow(n, p, 1)
  defp do_pow(_n, 0, r), do: r
  defp do_pow(n, p, r), do: do_pow(n, p - 1, r * n)

  @doc """
  Compute the fibonacci number at the index provided as argument
  """
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: do_fib(n - 1, 0, 1)
  defp do_fib(0, _a, b), do: b
  defp do_fib(n, a, b), do: do_fib(n - 1, b, a + b)

  # Lists

  @doc """
  Create a new list with each element inserted twice
  """
  def duplicate([]), do: []
  def duplicate(list), do: do_duplicate(list, [])

  defp do_duplicate([], result),
    do: Enum.reverse(result)

  defp do_duplicate([head | tail], result),
    do: do_duplicate(tail, [head, head | result])

  @doc """
  Create a new list, with each element of the input list as another list
  """
  def enlist([]), do: []
  def enlist(list), do: do_enlist(list, [])

  defp do_enlist([], result),
    do: Enum.reverse(result)

  defp do_enlist([head | tail], result),
    do: do_enlist(tail, [[head] | result])

  @doc """
  Create a new list with only the positive elements of the input list
  """
  def positives([]), do: []
  def positives(list), do: do_positives(list, [])

  defp do_positives([], result),
    do: Enum.reverse(result)

  defp do_positives([head | tail], result) do
    if head >= 0 do
      do_positives(tail, [head | result])
    else
      do_positives(tail, result)
    end
  end

  @doc """
  Add all the numbers in a list
  """
  def add_list(list), do: do_add_list(list, 0)
  defp do_add_list([], result), do: result
  defp do_add_list([head | tail], result), do: do_add_list(tail, result + head)

  @doc """
  Reverse the order of the pairs contained in the list
  """
  def invert_pairs(list), do: do_invert_pairs(list, [])

  defp do_invert_pairs([], result),
    do: Enum.reverse(result)

  defp do_invert_pairs([{one, two} | tail], result),
    do: do_invert_pairs(tail, [{two, one} | result])

  # Using built-in functions
  # def invert_pairs(list), do: Enum.map(list, &Enum.reverse/1)

  @doc """
  Check if all the elements in a list are atoms
  """
  def is_atom_list([]), do: true
  def is_atom_list([head | tail]) when is_atom(head), do: is_atom_list(tail)
  def is_atom_list([_head | _tail]), do: false

  @doc """
  Change any appearance of the second argument for the third, and vice-versa
  """
  def swapper(list, item_a, item_b), do: do_swapper(list, item_a, item_b, [])

  defp do_swapper([], _a, _b, result),
    do: Enum.reverse(result)

  defp do_swapper([head | tail], a, b, result) do
    cond do
      head == a -> do_swapper(tail, a, b, [b | result])
      head == b -> do_swapper(tail, a, b, [a | result])
      true -> do_swapper(tail, a, b, [head | result])
    end
  end

  @doc """
  Compute the dot product of two vectors of the same size
  """
  def dot_product(vec1, vec2) when length(vec1) == length(vec2),
    do: do_dot_product(vec1, vec2, 0)

  def dot_product(_vec1, _vec2),
    do: 0

  defp do_dot_product([], [], result),
    do: result

  defp do_dot_product([h1 | t1], [h2 | t2], result),
    do: do_dot_product(t1, t2, result + h1 * h2)

  @doc """
  Compute the average value of the elements in a list
  """
  def average([]), do: 0
  def average(list), do: do_average(list, 0, 0)

  defp do_average([], total, count),
    do: total / count

  defp do_average([head | tail], total, count),
    do: do_average(tail, total + head, count + 1)

  @doc """
  Compute the standard deviation from the mean of the elements in the list
  """
  def std_dev([]), do: 0
  def std_dev(list), do: do_std_dev(list, average(list), 0, 0)

  defp do_std_dev([], _avg, total, count),
    do: :math.sqrt(total / count)

  defp do_std_dev([head | tail], avg, total, count),
    do: do_std_dev(tail, avg, total + :math.pow(head - avg, 2), count + 1)

  @doc """
  Repeat each element in the list the number of times specified as argument
  """
  def replic(times, list), do: do_replic(times, 0, list, [])

  defp do_replic(_times, _count, [], result),
    do: Enum.reverse(result)

  defp do_replic(times, count, [_head | tail], result) when times == count,
    do: do_replic(times, 0, tail, result)

  defp do_replic(times, count, [head | tail], result),
    do: do_replic(times, count + 1, [head | tail], [head | result])

  @doc """
  Repeat each element in a list the number of times that corresponds
  to its position in the list, starting with position 1
  """
  def expand(list), do: do_expand(1, 0, list, [])

  defp do_expand(_times, _count, [], result),
    do: Enum.reverse(result)

  defp do_expand(times, count, [_head | tail], result) when times == count,
    do: do_expand(times + 1, 0, tail, result)

  defp do_expand(times, count, [head | tail], result),
    do: do_expand(times, count + 1, [head | tail], [head | result])

  @doc """
  Conver an integer number into a list of 0s and 1s that represents its
  binary value
  """
  def binary(number), do: do_binary(number, [])

  defp do_binary(0, result),
    do: result

  defp do_binary(number, result),
    do: do_binary(div(number, 2), [rem(number, 2) | result])
end
