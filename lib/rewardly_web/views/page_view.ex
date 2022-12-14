defmodule RewardlyWeb.PageView do
  use RewardlyWeb, :view
  alias Rewardly.Users
  alias Rewardly.Reports

  def users_count() do
    Users.get_users_count()
  end

  def get_rewards_amount(user_id) do
    Reports.get_amount_of_rewards(user_id)
  end

  def get_rewards_amount_this_month(user_id) do
    Reports.get_amount_of_rewards_this_month(user_id)
  end
end
