defmodule TartMarket.Accounts.FbUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias TartMarket.Accounts.FbUser


  schema "fb_users" do
    field :access_token, :string
    field :access_token_expires_at, :utc_datetime
    field :email, :string
    field :fbid, :string
    field :gender, :string
    field :image, :string
    field :link, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%FbUser{} = fb_user, attrs) do
    fb_user
    |> cast(attrs, [:name, :fbid, :email, :gender, :link, :image, :access_token, :access_token_expires_at])
    |> validate_required([:name, :fbid, :email, :gender, :link, :image, :access_token, :access_token_expires_at])
  end
end
