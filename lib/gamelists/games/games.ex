defmodule Gamelists.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias Gamelists.Repo

  alias Gamelists.Games.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  def list_games_by_system(system) do
    from(g in Game, where: g.system == ^system)
    |> Repo.all()
  end

  def list_systems do
    from(g in Game, select: g.system)
    |> Repo.all()
    |> Enum.uniq()
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)
end
