defmodule Rewardly.Rewards.Reward do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rewards" do
    field :amount, :integer
    field :title, :string
    field :user_id, :id
    field :by_id, :id

    timestamps()
  end

  @doc false
  def changeset(reward, attrs) do
    reward
    |> cast(attrs, [:title, :amount])
    |> validate_required([:title, :amount])
  end
end
