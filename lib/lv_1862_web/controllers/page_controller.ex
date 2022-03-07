defmodule Lv1862Web.PageController do
  use Lv1862Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
