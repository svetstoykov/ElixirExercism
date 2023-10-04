defmodule RationalNumbers do
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce
  end

  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce
  end

  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce
  end

  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1}
    |> reduce
  end

  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)}
    |> reduce
  end

  def pow_rational({a, b}, n) when n < 0 do
    power = Kernel.abs(n)

    {Integer.pow(b, power), Integer.pow(a, power)}
    |> reduce
  end

  def pow_rational({a, b}, n) do
    {Integer.pow(a, n), Integer.pow(b, n)}
    |> reduce
  end

  def pow_real(x, {a, b}) do
    :math.pow(x ** a, 1.0 / b)
  end

  def reduce({a, b}) do
    gcd_value = Kernel.abs(gcd(a, b))

    {div(a, gcd_value), div(b, gcd_value)}
    |> normalize
  end

  defp normalize({a, b}) when b < 0, do: {-a, -b}
  defp normalize({a, b}), do: {a,b}

  defp gcd(0, b), do: b
  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))
end
