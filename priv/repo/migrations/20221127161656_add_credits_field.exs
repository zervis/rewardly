defmodule Rewardly.Repo.Migrations.AddCreditsField do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :credits, :integer, default: 50
    end
  end
end
