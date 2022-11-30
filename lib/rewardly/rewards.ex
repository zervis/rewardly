defmodule Rewardly.Rewards do
  @moduledoc """
  The Rewards context.
  """
  #@behaviour Bodyguard.Policy

  import Ecto.Query, warn: false
  alias Rewardly.Repo

  alias Rewardly.Rewards.Reward

  @doc """
  def authorize(:update_reward, %{role: :admin} = _user, _post), do: :ok
  def authorize(:change_reward, %{role: :admin} = _user, _post), do: :ok
  def authorize(:delete_reward, %{role: :admin} = _user, _post), do: :ok
  # Otherwise, denied
  def authorize(:update_reward, _user, _post), do: :error
  def authorize(:change_reward, _user, _post), do: :error
  def authorize(:delete_reward, _user, _post), do: :error
  """
  @doc """
  Returns the list of rewards.

  ## Examples

      iex> list_rewards()
      [%Reward{}, ...]

  """
  def list_rewards do
    query = Reward |> order_by(desc: :id)

    query
    |> Repo.all()
    |> Repo.preload([:user, :by])
  end

  @doc """
  Gets a single reward.

  Raises `Ecto.NoResultsError` if the Reward does not exist.

  ## Examples

      iex> get_reward!(123)
      %Reward{}

      iex> get_reward!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reward!(id), do: Repo.get!(Reward, id)

  @doc """
  Creates a reward.

  ## Examples

      iex> create_reward(%{field: value})
      {:ok, %Reward{}}

      iex> create_reward(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reward(attrs \\ %{}) do
    %Reward{}
    |> Reward.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reward.

  ## Examples

      iex> update_reward(reward, %{field: new_value})
      {:ok, %Reward{}}

      iex> update_reward(reward, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reward(%Reward{} = reward, attrs) do
    reward
    |> Reward.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reward.

  ## Examples

      iex> delete_reward(reward)
      {:ok, %Reward{}}

      iex> delete_reward(reward)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reward(%Reward{} = reward) do
    Repo.delete(reward)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reward changes.

  ## Examples

      iex> change_reward(reward)
      %Ecto.Changeset{data: %Reward{}}

  """
  def change_reward(%Reward{} = reward, attrs \\ %{}) do
    Reward.changeset(reward, attrs)
  end
end
