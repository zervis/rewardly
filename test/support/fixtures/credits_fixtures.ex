defmodule Rewardly.CreditsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rewardly.Credits` context.
  """

  @doc """
  Generate a credit.
  """
  def credit_fixture(attrs \\ %{}) do
    {:ok, credit} =
      attrs
      |> Enum.into(%{
        amount: 42,
        user_id: 42
      })
      |> Rewardly.Credits.create_credit()

    credit
  end
end
