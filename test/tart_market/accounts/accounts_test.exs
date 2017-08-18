defmodule TartMarket.AccountsTest do
  use TartMarket.DataCase

  alias TartMarket.Accounts

  describe "fb_users" do
    alias TartMarket.Accounts.FbUser

    @valid_attrs %{access_token: "some access_token", access_token_expires_at: "2010-04-17 14:00:00.000000Z", email: "some email", fbid: "some fbid", gender: "some gender", image: "some image", link: "some link", name: "some name"}
    @update_attrs %{access_token: "some updated access_token", access_token_expires_at: "2011-05-18 15:01:01.000000Z", email: "some updated email", fbid: "some updated fbid", gender: "some updated gender", image: "some updated image", link: "some updated link", name: "some updated name"}
    @invalid_attrs %{access_token: nil, access_token_expires_at: nil, email: nil, fbid: nil, gender: nil, image: nil, link: nil, name: nil}

    def fb_user_fixture(attrs \\ %{}) do
      {:ok, fb_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_fb_user()

      fb_user
    end

    test "list_fb_users/0 returns all fb_users" do
      fb_user = fb_user_fixture()
      assert Accounts.list_fb_users() == [fb_user]
    end

    test "get_fb_user!/1 returns the fb_user with given id" do
      fb_user = fb_user_fixture()
      assert Accounts.get_fb_user!(fb_user.id) == fb_user
    end

    test "create_fb_user/1 with valid data creates a fb_user" do
      assert {:ok, %FbUser{} = fb_user} = Accounts.create_fb_user(@valid_attrs)
      assert fb_user.access_token == "some access_token"
      assert fb_user.access_token_expires_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert fb_user.email == "some email"
      assert fb_user.fbid == "some fbid"
      assert fb_user.gender == "some gender"
      assert fb_user.image == "some image"
      assert fb_user.link == "some link"
      assert fb_user.name == "some name"
    end

    test "create_fb_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_fb_user(@invalid_attrs)
    end

    test "update_fb_user/2 with valid data updates the fb_user" do
      fb_user = fb_user_fixture()
      assert {:ok, fb_user} = Accounts.update_fb_user(fb_user, @update_attrs)
      assert %FbUser{} = fb_user
      assert fb_user.access_token == "some updated access_token"
      assert fb_user.access_token_expires_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert fb_user.email == "some updated email"
      assert fb_user.fbid == "some updated fbid"
      assert fb_user.gender == "some updated gender"
      assert fb_user.image == "some updated image"
      assert fb_user.link == "some updated link"
      assert fb_user.name == "some updated name"
    end

    test "update_fb_user/2 with invalid data returns error changeset" do
      fb_user = fb_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_fb_user(fb_user, @invalid_attrs)
      assert fb_user == Accounts.get_fb_user!(fb_user.id)
    end

    test "delete_fb_user/1 deletes the fb_user" do
      fb_user = fb_user_fixture()
      assert {:ok, %FbUser{}} = Accounts.delete_fb_user(fb_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_fb_user!(fb_user.id) end
    end

    test "change_fb_user/1 returns a fb_user changeset" do
      fb_user = fb_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_fb_user(fb_user)
    end
  end
end
