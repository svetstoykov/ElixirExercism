defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name)
    |> String.graphemes
    |> List.first
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase
    |> add_dot
  end

  def initials(full_name) do
    String.split(full_name, " ")
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    i1 = initials(full_name1)
    i2 = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end

  defp add_dot(letter), do: "#{letter}."
end
