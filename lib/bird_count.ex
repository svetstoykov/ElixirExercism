defmodule BirdCount do
  @moduledoc """
  A module for working with bird count data.
  """

  @doc """
  Retrieves the bird count for today from a list.

  ## Examples

      iex> BirdCount.today([10, 5, 2, 0])
      10

  """
  def today([]), do: nil
  def today([head | _]), do: head

  @doc """
  Increments the bird count for the current day in a list.

  ## Examples

      iex> BirdCount.increment_day_count([10, 5, 2, 0])
      [11, 5, 2, 0]

  """
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @doc """
  Checks if there is a day without bird sightings (count = 0) in a list.

  ## Examples

      iex> BirdCount.has_day_without_birds?([10, 5, 2, 0])
      true

  """
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  @doc """
  Calculates the total number of birds seen in a list.

  ## Examples

      iex> BirdCount.total([10, 5, 2, 0])
      17

  """
  def total(list), do: total(list, 0)
  defp total([], total_birds), do: total_birds
  defp total([head | tail], total_birds), do: total(tail, total_birds + head)

  @doc """
  Counts the number of busy days (bird count >= 5) in a list.

  ## Examples

      iex> BirdCount.busy_days([10, 5, 2, 0])
      2

  """
  def busy_days(list), do: busy_days(list, 0)
  @spec busy_days(list, any) :: any
  defp busy_days([], busy_days_count), do: busy_days_count
  defp busy_days([head | tail], busy_days_count) when head >= 5, do: busy_days(tail, busy_days_count + 1)
  defp busy_days([_ | tail], busy_days_count), do: busy_days(tail, busy_days_count)
end
