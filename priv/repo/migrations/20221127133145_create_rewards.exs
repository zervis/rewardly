defmodule Rewardly.Repo.Migrations.CreateRewards do
  use Ecto.Migration

  def change do
    create table(:rewards) do
      add :amount, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :by_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:rewards, [:user_id])
    create index(:rewards, [:by_id])
  end
end
