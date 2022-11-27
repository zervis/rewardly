defmodule RewardlyWeb.UsersView do
    use RewardlyWeb, :view
    alias Rewardly.Users

    def get_rewards_amount(user_id) do
      Users.get_amount_of_rewards(user_id)
    end

    def get_rewards_amount_this_month(user_id) do
      Users.get_amount_of_rewards_this_month(user_id)
    end
  end