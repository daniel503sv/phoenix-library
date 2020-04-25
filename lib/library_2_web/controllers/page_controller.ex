defmodule Library2Web.PageController do
  use Library2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
