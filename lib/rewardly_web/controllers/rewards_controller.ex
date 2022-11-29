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

    def show(conn, %{"id" => id}) do
      reward =
          id
          |> Rewards.get_reward!
  
      changeset = Reward.changeset(%Reward{}, %{})
      render(conn, "show.html", reward: reward, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    reward = Rewards.get_reward!(id)
    changeset = Rewards.change_reward(reward)
    render(conn, "edit.html", reward: reward, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reward" => reward_params}) do
    reward = Rewards.get_reward!(id)

    case Rewards.update_reward(reward, reward_params) do
      {:ok, reward} ->
        conn
        |> put_flash(:info, "Reward updated successfully.")
        |> redirect(to: Routes.rewards_path(conn, :edit, reward))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", reward: reward, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reward = Rewards.get_reward!(id)
    
    reward
    |> Repo.delete!

    conn
      |> put_flash(:info, "Reward Deleted")
      |> redirect(to: Routes.rewards_path(conn, :index))
  end

end