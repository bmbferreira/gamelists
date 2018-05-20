defmodule Gamelists.Games.Game do
  @moduledoc "Game resource"

  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field(:system, :string)
    field(:release_date, :date)
    field(:name, :string)
    field(:publisher, :string)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:system, :release_date, :name, :publisher])
    |> validate_required([:system, :release_date, :name, :publisher])
  end
end
