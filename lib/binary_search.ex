defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  def search(numbers, key) when is_tuple(numbers) do
    list = Tuple.to_list(numbers)

    search(list, key, 0, length(list) - 1)
  end

  defp search(_list, _key, low, high) when low > high, do: :not_found

  defp search(list, key, low, high) do
    mid_index = Kernel.div(low + high, 2)

    mid_num = Enum.at(list, mid_index)

    case key do
      key when key == mid_num -> {:ok, mid_index}
      key when key > mid_num -> search(list, key, mid_index + 1, high)
      _ -> search(list, key, low, mid_index - 1)
    end
  end
end
