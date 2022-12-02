defmodule Rewardly.RewardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rewardly.Rewards` context.
  """

  @doc """
  Generate a reward.
  """
  def reward_fixture(attrs \\ %{}) do
    {:ok, reward} =
      attrs
      |> Enum.into(%{
        amount: 42,
        title: "some title",
        user_id: 1,
        by_id: 2
      })
      |> Rewardly.Rewards.create_reward()

    reward
  end
end
