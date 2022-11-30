defmodule RewardlyWeb.ReportsController do
    use RewardlyWeb, :controller

    alias Rewardly.Reports


    def index(conn, _params) do
      months = Reports.list_months()
      render(conn, "index.html", months: months)
    end

    def show(conn, %{"id" => date}) do
      current_user = conn.assigns.current_user

      if current_user.role == "admin" do
          rewards = Reports.list_reports(date)
          render(conn, "show.html", date: date, rewards: rewards)
      else
        conn
        |> put_flash(:error, "Users can't view reports")
        |> redirect(to: Routes.page_path(conn, :index))
      end
  end

end
