defmodule RewardlyWeb.PageView do
  use RewardlyWeb, :view
  alias Rewardly.Users

  def users_count() do
    Users.get_users_count()
  end

end
