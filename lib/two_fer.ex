defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  def two_fer(name \\ "you") when is_binary(name) do
    "One for #{name}, one for me."
  end
end
