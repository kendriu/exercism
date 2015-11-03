defmodule Teenager do
  def hey(input) do
    cond do
        String.ends_with? input, "?" -> "Sure."
        String.strip(input) == "" -> "Fine. Be that way!"
        String.downcase(input) != input and String.upcase(input) == input -> "Whoa, chill out!"
        true -> "Whatever."

    end
  end
end
