defmodule Gamelists.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :system, :string
      add :release_date, :date
      add :name, :string
      add :publisher, :string
      timestamps()
    end
  end

end
