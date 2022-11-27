defmodule RewardlyWeb.RewardsController do
    use RewardlyWeb, :controller
  
    alias Rewardly.Users
    alias Rewardly.Rewards
    alias Rewardly.Rewards.Reward
    alias Rewardly.Repo
  
    def index(conn, _params) do
      rewards = Rewards.list_rewards()
      render(conn, "index.html", rewards: rewards)
    end

end