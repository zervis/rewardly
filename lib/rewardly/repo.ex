defmodule Rewardly.Repo do
  use Ecto.Repo,
    otp_app: :rewardly,
    adapter: Ecto.Adapters.Postgres
end
