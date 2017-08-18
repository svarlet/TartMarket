defmodule TartMarket.Repo.Migrations.CreateFbUsers do
  use Ecto.Migration

  def change do
    create table(:fb_users) do
      add :name, :string
      add :fbid, :string
      add :email, :string
      add :gender, :string
      add :link, :string
      add :image, :string
      add :access_token, :string
      add :access_token_expires_at, :utc_datetime

      timestamps()
    end

    create index(:fb_users, :fbid, unique: true)
  end
end
