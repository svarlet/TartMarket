defmodule TartMarketWeb.FbUserControllerTest do
  use TartMarketWeb.ConnCase

  alias TartMarket.Accounts

  @create_attrs %{access_token: "some access_token", access_token_expires_at: "2010-04-17 14:00:00.000000Z", email: "some email", fbid: "some fbid", gender: "some gender", image: "some image", link: "some link", name: "some name"}
  @update_attrs %{access_token: "some updated access_token", access_token_expires_at: "2011-05-18 15:01:01.000000Z", email: "some updated email", fbid: "some updated fbid", gender: "some updated gender", image: "some updated image", link: "some updated link", name: "some updated name"}
  @invalid_attrs %{access_token: nil, access_token_expires_at: nil, email: nil, fbid: nil, gender: nil, image: nil, link: nil, name: nil}

  def fixture(:fb_user) do
    {:ok, fb_user} = Accounts.create_fb_user(@create_attrs)
    fb_user
  end

  describe "index" do
    test "lists all fb_users", %{conn: conn} do
      conn = get conn, fb_user_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Fb users"
    end
  end

  describe "new fb_user" do
    test "renders form", %{conn: conn} do
      conn = get conn, fb_user_path(conn, :new)
      assert html_response(conn, 200) =~ "New Fb user"
    end
  end

  describe "create fb_user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, fb_user_path(conn, :create), fb_user: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == fb_user_path(conn, :show, id)

      conn = get conn, fb_user_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Fb user"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, fb_user_path(conn, :create), fb_user: @invalid_attrs
      assert html_response(conn, 200) =~ "New Fb user"
    end
  end

  describe "edit fb_user" do
    setup [:create_fb_user]

    test "renders form for editing chosen fb_user", %{conn: conn, fb_user: fb_user} do
      conn = get conn, fb_user_path(conn, :edit, fb_user)
      assert html_response(conn, 200) =~ "Edit Fb user"
    end
  end

  describe "update fb_user" do
    setup [:create_fb_user]

    test "redirects when data is valid", %{conn: conn, fb_user: fb_user} do
      conn = put conn, fb_user_path(conn, :update, fb_user), fb_user: @update_attrs
      assert redirected_to(conn) == fb_user_path(conn, :show, fb_user)

      conn = get conn, fb_user_path(conn, :show, fb_user)
      assert html_response(conn, 200) =~ "some updated access_token"
    end

    test "renders errors when data is invalid", %{conn: conn, fb_user: fb_user} do
      conn = put conn, fb_user_path(conn, :update, fb_user), fb_user: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Fb user"
    end
  end

  describe "delete fb_user" do
    setup [:create_fb_user]

    test "deletes chosen fb_user", %{conn: conn, fb_user: fb_user} do
      conn = delete conn, fb_user_path(conn, :delete, fb_user)
      assert redirected_to(conn) == fb_user_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, fb_user_path(conn, :show, fb_user)
      end
    end
  end

  defp create_fb_user(_) do
    fb_user = fixture(:fb_user)
    {:ok, fb_user: fb_user}
  end
end
