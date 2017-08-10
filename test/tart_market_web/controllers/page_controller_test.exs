defmodule TartMarketWeb.PageControllerTest do
  use TartMarketWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  describe "about us" do
    test "GET /aboutus should return a 200", %{conn: conn} do
      conn
      |> get(page_path(conn, :aboutus))
      |> html_response(200)
    end
  end

  describe "home page" do
    test "has a sign up button", %{conn: conn} do
      assert conn
      |> get("/")
      |> html_response(200)
      =~ ~S{<a class="btn btn-default" href="#" role="button">Sign up</a>}
    end
  end
end
