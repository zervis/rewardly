defmodule Rewardly.Rewards.Reward do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rewards" do
    field :amount, :integer
    field :title, :string
    #field :user_id, :id
    #field :by_id, :id
    belongs_to(:user, Rewardly.Users.User)
    belongs_to(:by, Rewardly.Users.User)
    
    timestamps()
  end

  @doc false
  def changeset(reward, attrs) do
    reward
    |> cast(attrs, [:user_id, :amount, :by_id])
    |> validate_required([:user_id, :amount])
  end
end
