defmodule RewardlyWeb.ReportsController do
    use RewardlyWeb, :controller

    alias Rewardly.Users
    alias Rewardly.Reports
    alias Rewardly.Rewards
    alias Rewardly.Rewards.Reward
    alias Rewardly.Repo
  
    def index(conn, _params) do
      users = Rewards.list_rewards()
      months = Reports.list_months()
      render(conn, "index.html", months: months, users: users)
    end

    def show(conn, %{"id" => date}) do
          #users = Rewards.list_rewards()
          rewards = Reports.list_reports(date)
      #changeset = Reward.changeset(%Reward{}, %{})
      render(conn, "show.html", date: date, rewards: rewards)
  end



end