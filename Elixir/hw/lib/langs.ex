# Module with functions to define languages recursively
#
# Gilberto Echeverria
# 2024-03-15

defmodule Hw.Langs.Rec do

  @doc """
  A function that applies another function (received as an argument)
  to every element in a list
  """
  def my_map(list, func), do: do_map(list, func, [])

  defp do_map([], _func, result), do: Enum.reverse(result)
  defp do_map([head | tail], func, result), do: do_map(tail, func, [func.(head) | result])

  @doc """
  Function to generate a number of iterations on a recursively defined language
  """
  def generate(iters, base, rules),
    do: do_generate(iters, rules, [base])

  defp do_generate(0, _rules, result),
    do: Enum.reverse(result)
  defp do_generate(iters, rules, [strings | rest]),
    do: do_generate(iters - 1, rules, [iterate_strings(strings, rules), strings | rest])

  def iterate_strings(strings, rules),
    do: do_iterate_strings(strings, rules, [])

  defp do_iterate_strings([], _rules, result),
    do: List.flatten(result)
  defp do_iterate_strings([string | rest], rules, result),
    do: do_iterate_strings(rest, rules, [apply_rules(string, rules) | result])

  def apply_rules(string, rules),
    do: do_apply_rules(string, rules, [])

  defp do_apply_rules(_string, [], result),
    do: result
  defp do_apply_rules(string, [rule | rest], result),
    do: do_apply_rules(string, rest, [apply_rule(string, rule) | result])

  def apply_rule(string, rule),
    do: String.replace(rule, "u", string)

end
