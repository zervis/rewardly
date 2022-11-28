defmodule Rewardly.Reports do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false

  alias Rewardly.Repo
  alias Rewardly.Rewards
  alias Rewardly.Rewards.Reward

  alias Rewardly.Users.{User, UserToken, UserNotifier}


  def list_months do
    query = from(p in Reward, distinct: [fragment("date_part('year', ?)", p.inserted_at), fragment("date_part('month', ?)", p.inserted_at)], order_by: [{:desc, :inserted_at}])
    query
    |> Repo.all()
    |> Repo.preload([:user, :by])
  end

  def list_reports(date) do

    date_with_time = date <> " 00:00:00"
    my_date =  NaiveDateTime.from_iso8601!(date_with_time)
    year = my_date.year
    month = my_date.month
    query = from(p in Reward, distinct: p.user_id, where: fragment("date_part(?, ?)", "year", p.inserted_at) == ^year, where: fragment("date_part(?, ?)", "month", p.inserted_at) == ^month)

    query
    |> Repo.all()
    |> Repo.preload([:user])
  end

  def get_amount_of_rewards(user_id) do
    total = Repo.one(from p in Reward, where: p.user_id == ^user_id, select: sum(p.amount))
  end

  def get_amount_of_rewards_month(date, user_id) do
    current_month = date.month
    current_year = date.year
    month_total = Repo.one(from p in Reward, where: p.user_id == ^user_id and ^current_year == fragment("date_part('year', ?)", p.inserted_at) and ^current_month == fragment("date_part('month', ?)", p.inserted_at), select: sum(p.amount))
  end

  def get_amount_of_rewards_this_month(user_id) do
    current_date = Date.utc_today()
    current_month = current_date.month
    month_total = Repo.one(from p in Reward, where: p.user_id == ^user_id and ^current_month == fragment("date_part('month', ?)", p.inserted_at), select: sum(p.amount))
  end

end
