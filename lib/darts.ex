defmodule Darts do
  def score({x, y}) do
    :math.pow(x, 2) + :math.pow(y, 2)
    |> get_score
  end

  defp get_score(distance) do
    case distance do
      d when d <= 1 -> 10
      d when d <= 25 -> 5
      d when d <= 100 -> 1
      _ -> 0
    end
  end
end
