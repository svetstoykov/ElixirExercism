defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)

    trunc(Float.ceil((apply_discount(daily_rate * 22, discount))))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = apply_discount(daily_rate(hourly_rate), discount)

    Float.floor(budget / daily_rate, 1)
  end
end
