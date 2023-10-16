defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(:earth, seconds), do: round_response(earth_seconds_to_years(seconds))

  def age_on(:mercury, seconds), do: round_response(earth_seconds_to_years(seconds) / 0.2408467)
  def age_on(:venus, seconds), do: round_response(earth_seconds_to_years(seconds) / 0.61519726)
  def age_on(:mars, seconds), do: round_response(earth_seconds_to_years(seconds) / 1.8808158)
  def age_on(:jupiter, seconds), do: round_response(earth_seconds_to_years(seconds) / 11.862615)
  def age_on(:saturn, seconds), do: round_response(earth_seconds_to_years(seconds) / 29.447498)
  def age_on(:uranus, seconds), do: round_response(earth_seconds_to_years(seconds) / 84.016846)
  def age_on(:neptune, seconds), do: round_response(earth_seconds_to_years(seconds) / 164.79132)

  def age_on(_planet, _seconds), do: {:error, "not a planet"}

  defp earth_seconds_to_years(seconds), do: seconds / 60 / 60 / 24 / 365.25
  defp round_response(value), do: {:ok, Float.round(value, 2)}
end
