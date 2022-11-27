defmodule RewardlyWeb.PageController do
  use RewardlyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
