defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_head | tail]) do
    tail
  end

  def first([head | _tail]) do
    head
  end

  def count(list), do: count(list, 0)

  defp count(list, acc) when list != [], do: count(remove(list), acc + 1)

  defp count([], acc), do: acc

  def functional_list?(list) do
    list
    |> Enum.filter(&(&1 == "Elixir"))
    |> count > 0
  end
end
