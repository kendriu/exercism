defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    if length(a) > length(b) do
      _compare(a, b, a, :superlist)
    else
      _compare(b, a, b, :sublist)
    end
  end
  defp _compare(a, [], a, result), do: result
  defp _compare(_, [], _, _), do: :unequal
  defp _compare(a, [head | tail], org_a, result) do
    _compare([head| a], tail, org_a, result)
  end
end
