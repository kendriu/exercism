defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    if length(a) > length(b) do
      _compare(a, b, :superlist)
    else
      _compare(b, a, :sublist)
    end
  end

  defp _compare([], _, _), do: :unequal
  defp _compare(_, [], result), do: result
  defp _compare(a=[ha | ta], b=[hb | _], result) when ha === hb do
    if _local_compare(a, b) == :unequal do
      _compare(ta, b, result)
    else
      result
    end
  end
  defp _compare([_ | t], b, result),do: _compare(t,b, result)

  defp _local_compare(_, []),  do: []
  defp _local_compare([ha | ta], [hb | tb]) when ha === hb,  do: _local_compare(ta, tb)
  defp _local_compare(_, _), do: :unequal

end
