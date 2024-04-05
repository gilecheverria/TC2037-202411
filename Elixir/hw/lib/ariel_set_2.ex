# Functions with recursion on lists
#
# Gilberto Echeverria
# 2024-04-05

defmodule Hw.Ariel2 do

  @doc """
  Insert the given item at every possible position within the list, from the beginning to the end
  Return a list of lists with the result of inserting at every position
  """
  def insert_everywhere(list, item), do: do_insert_every(list, item, [], length(list))

  defp do_insert_every(list, item, res, -1),
    do: res
  defp do_insert_every(list, item, res, index),
    do: do_insert_every(list, item, [insert_at(list, item, index) | res], index - 1)

  @doc """
  Insert an item at the specified position within a list, starting with
  index 0 at the very beginning. If the index is larger than the size of the list, the item
  is inserted at the end
  """
  def insert_at(list, index, item) when index < -(length(list) + 1),
    do: do_insert_at(list, 0, item, [])
  def insert_at(list, index, item) when index < 0,
    do: do_insert_at(list, length(list) + 1 + index, item, [])
  def insert_at(list, index, item) when index > length(list),
    do: do_insert_at(list, length(list), item, [])
  def insert_at(list, index, item),
    do: do_insert_at(list, index, item, [])

  defp do_insert_at(list, 0, item, res),
    do: Enum.reverse(res) ++ [item | list]
  defp do_insert_at([head | tail], index, item, res),
    do: do_insert_at(tail, index - 1, item, [head | res])

end
