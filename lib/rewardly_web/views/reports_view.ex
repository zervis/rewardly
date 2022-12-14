defmodule RewardlyWeb.ReportsView do
    use RewardlyWeb, :view
    alias Rewardly.Reports

    def get_rewards_amount(user_id) do
      Reports.get_amount_of_rewards(user_id)
    end

    def get_rewards_amount_this_month(user_id) do
      Reports.get_amount_of_rewards_this_month(user_id)
    end

    def get_rewards_amount_month(date, user_id) do
      Reports.get_amount_of_rewards_month(date, user_id)
    end

  end