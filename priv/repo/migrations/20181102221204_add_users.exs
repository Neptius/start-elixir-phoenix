defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :title, :string
    end
  end
end
config :steamex, Steamex,
  redirect_to: "/profile/me"
