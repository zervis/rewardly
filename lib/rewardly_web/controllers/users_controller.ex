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

    def add_reward(conn, %{"reward" => reward_params, "users_id" => user_id}) do
      user =
          user_id
          |> Users.get_user!()
          |> Repo.preload([:rewards])
      case Users.add_reward(user_id, reward_params) do
          {:ok, _reward} ->
              conn
              |> put_flash(:info, "Added reward!")
              |> redirect(to: Routes.users_path(conn, :show, user))
          {:error, _error} ->
              conn
              |> put_flash(:error, "Oops! Couldn't add reward!")
              |> redirect(to: Routes.users_path(conn, :show, user))
      end
  end

  def show(conn, %{"id" => id}) do
      user =
          id
          |> Users.get_user!
          |> Repo.preload([:rewards])
  
      changeset = Reward.changeset(%Reward{}, %{})
      render(conn, "show.html", user: user, changeset: changeset)
  end

end