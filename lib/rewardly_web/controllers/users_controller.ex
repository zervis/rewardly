defmodule RewardlyWeb.UsersController do
    use RewardlyWeb, :controller
  
    alias Rewardly.Users
    alias Rewardly.Rewards
    alias Rewardly.Rewards.Reward
    alias Rewardly.Repo
  
    def index(conn, _params) do
      users = Users.list_users()
      render(conn, "index.html", users: users)
    end

end