defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
      String.downcase(sentence)
      |> String.replace(~r/[^\w-]/u, " ")
      |> String.split([" ", "_"])
      |> Enum.filter(&(&1 != ""))
      |> Enum.reduce(%{}, fn word, acc ->
           Dict.update(acc, word, 1, &(&1 + 1))  end)
  end
end
