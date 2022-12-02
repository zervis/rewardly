defmodule RewardlyWeb.FourOhFourController do
    use RewardlyWeb, :controller
    
    def index(conn, _params) do
      conn
      |> put_view(RewardlyWeb.FourOhFourView)
      |> render(:"404")
    end
  end