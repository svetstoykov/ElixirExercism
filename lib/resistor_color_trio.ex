defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
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

  @giga_scale 1_000_000_000
  @mega_scale 1_000_000
  @kilo_scale 1_000

  def label([color1, color2, color3 | _tail]) do
    main_value = @colors[color1] * 10 + @colors[color2]

    total_value = main_value * Integer.pow(10, @colors[color3])

    case total_value do
      total_value when total_value >= @giga_scale -> {scale_to_unit(total_value, @giga_scale), :gigaohms}
      total_value when total_value >= @mega_scale -> {scale_to_unit(total_value, @mega_scale), :megaohms}
      total_value when total_value >= @kilo_scale -> {scale_to_unit(total_value, @kilo_scale), :kiloohms}
      _ ->{total_value, :ohms}
    end
  end

  defp scale_to_unit(value, scale), do: Kernel.div(value, scale)
end
