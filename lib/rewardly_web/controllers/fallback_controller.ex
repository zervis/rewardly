defmodule RewardlyWeb.FallbackController do
    use RewardlyWeb, :controller
  
    def call(conn, {:error, :unauthorized}) do
      conn
      |> put_status(:forbidden)
      |> put_view(RewardlyWeb.ErrorView)
      |> render(:"403")
    end
  end