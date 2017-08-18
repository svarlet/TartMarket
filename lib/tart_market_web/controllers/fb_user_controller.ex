defmodule TartMarketWeb.FbUserController do
  use TartMarketWeb, :controller

  alias TartMarket.Accounts
  alias TartMarket.Accounts.FbUser

  def index(conn, _params) do
    fb_users = Accounts.list_fb_users()
    render(conn, "index.html", fb_users: fb_users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_fb_user(%FbUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"fb_user" => fb_user_params}) do
    case Accounts.create_fb_user(fb_user_params) do
      {:ok, fb_user} ->
        conn
        |> put_flash(:info, "Fb user created successfully.")
        |> redirect(to: fb_user_path(conn, :show, fb_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fb_user = Accounts.get_fb_user!(id)
    render(conn, "show.html", fb_user: fb_user)
  end

  def edit(conn, %{"id" => id}) do
    fb_user = Accounts.get_fb_user!(id)
    changeset = Accounts.change_fb_user(fb_user)
    render(conn, "edit.html", fb_user: fb_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fb_user" => fb_user_params}) do
    fb_user = Accounts.get_fb_user!(id)

    case Accounts.update_fb_user(fb_user, fb_user_params) do
      {:ok, fb_user} ->
        conn
        |> put_flash(:info, "Fb user updated successfully.")
        |> redirect(to: fb_user_path(conn, :show, fb_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", fb_user: fb_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fb_user = Accounts.get_fb_user!(id)
    {:ok, _fb_user} = Accounts.delete_fb_user(fb_user)

    conn
    |> put_flash(:info, "Fb user deleted successfully.")
    |> redirect(to: fb_user_path(conn, :index))
  end
end
