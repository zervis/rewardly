defmodule Rewardly.MonthlyWorker do
  use Oban.Worker, queue: :default

  def perform(%Oban.Job{}) do
    Rewardly.Users.update_all_credits()
    :ok
  end
end
