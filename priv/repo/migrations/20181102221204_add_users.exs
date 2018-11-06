defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :title, :string
      add :steamid, :string
      add :personaname, :string
      add :profileurl, :string
      add :avatar, :string
      add :avatarmedium, :string
      add :avatarfull, :string
      add :communityvisibilitystate, :integer
    end
  end
end
