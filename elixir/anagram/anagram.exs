defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(_, []), do: []
  def match(base, [base | t]), do: match(base, t)
  def match(base, [h | t]) do
    if anagrams?(String.downcase(base), String.downcase(h)) do
      [h | match(base, t)]
    else
      match(base, t)
    end
  end

  def anagrams?(base, base), do: false
  def anagrams?(base, candidate) do
    sort = &(&1
               |> String.to_char_list
               |> Enum.sort)
    sort.(base) == sort.(candidate)
  end
end
