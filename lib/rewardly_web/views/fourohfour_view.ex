defmodule RewardlyWeb.FourOhFourView do
  use RewardlyWeb, :view


  def render("404.html", _assigns) do
      "Page not found!"
  end

end