defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  defp _count([], acc), do: acc
  defp _count([head | tail], acc), do: _count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], acc), do: acc
  defp _reverse([head | tail], acc) do
    _reverse(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append([head | tail], b), do: [head | append(tail, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]) do
    append(head, concat(tail))
  end
end
