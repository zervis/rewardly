defmodule Rewardly.Workers.MonthlyWorker do
  use Oban.Worker, queue: :default

  alias Rewardly.Users

  def perform(_job) do
    Users.update_all_credits()
    :ok
  end
end
