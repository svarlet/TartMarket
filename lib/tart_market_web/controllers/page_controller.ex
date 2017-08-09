defmodule TartMarketWeb.PageController do
  use TartMarketWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def aboutus(conn, _params) do
    render conn, "aboutus.html"
  end
end
