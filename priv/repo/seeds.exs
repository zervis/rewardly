# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rewardly.Repo.insert!(%Rewardly.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#create admin

alias Rewardly.Repo
alias Rewardly.Users
alias Rewardly.Users.User

Users.register_user(%{email: "jobs@curiosum.com", password: "curiosumphoenixapp", name: "Super", surname: "Admin", role: "admin"})
