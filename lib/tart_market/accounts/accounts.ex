defmodule TartMarket.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias TartMarket.Repo

  alias TartMarket.Accounts.FbUser

  @doc """
  Returns the list of fb_users.

  ## Examples

      iex> list_fb_users()
      [%FbUser{}, ...]

  """
  def list_fb_users do
    Repo.all(FbUser)
  end

  @doc """
  Gets a single fb_user.

  Raises `Ecto.NoResultsError` if the Fb user does not exist.

  ## Examples

      iex> get_fb_user!(123)
      %FbUser{}

      iex> get_fb_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fb_user!(id), do: Repo.get!(FbUser, id)

  @doc """
  Creates a fb_user.

  ## Examples

      iex> create_fb_user(%{field: value})
      {:ok, %FbUser{}}

      iex> create_fb_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fb_user(attrs \\ %{}) do
    %FbUser{}
    |> FbUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fb_user.

  ## Examples

      iex> update_fb_user(fb_user, %{field: new_value})
      {:ok, %FbUser{}}

      iex> update_fb_user(fb_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fb_user(%FbUser{} = fb_user, attrs) do
    fb_user
    |> FbUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FbUser.

  ## Examples

      iex> delete_fb_user(fb_user)
      {:ok, %FbUser{}}

      iex> delete_fb_user(fb_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fb_user(%FbUser{} = fb_user) do
    Repo.delete(fb_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fb_user changes.

  ## Examples

      iex> change_fb_user(fb_user)
      %Ecto.Changeset{source: %FbUser{}}

  """
  def change_fb_user(%FbUser{} = fb_user) do
    FbUser.changeset(fb_user, %{})
  end
end
