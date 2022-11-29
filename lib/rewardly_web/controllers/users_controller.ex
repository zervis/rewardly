defmodule RewardlyWeb.UsersController do
    use RewardlyWeb, :controller
  
    alias Rewardly.Users
    alias Rewardly.Rewards
    alias Rewardly.Rewards.Reward
    alias Rewardly.Repo
    alias RewardlyWeb.UserAuth
    alias Rewardly.Users.UserNotifier
    alias Rewardly.Mailer
  
    def index(conn, _params) do
      users = Users.list_users()
      render(conn, "index.html", users: users)
    end

    def add_reward(conn, %{"reward" => reward_params, "users_id" => user_id}) do
      current_user = conn.assigns.current_user
 
      user =
          user_id
          |> Users.get_user!()
          |> Repo.preload([:rewards])

      case Users.add_reward(user_id, current_user, reward_params) do
          {:ok, _reward} ->
              UserNotifier.reward_info(user) |> Mailer.deliver()

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

  def edit(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    changeset = Users.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Credit updated successfully.")
        |> redirect(to: Routes.users_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end

end