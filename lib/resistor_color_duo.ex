defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """

  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @spec value(colors :: [atom]) :: integer
  def value([color_10, color_1|_]), do: 10 * @colors[color_10] + @colors[color_1]
end
