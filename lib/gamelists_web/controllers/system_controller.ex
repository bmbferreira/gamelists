defmodule GamelistsWeb.SystemController do
  use GamelistsWeb, :controller
  alias Gamelists.Games

  action_fallback(GamelistsWeb.FallbackController)

  def index(conn, _params) do
    systems = Games.list_systems()

    conn
    |> render("index.json", systems: systems)
  end

  def show(conn, %{"id" => id}) do
    games = Games.list_games_by_system(id)

    conn
    |> put_view(GamelistsWeb.GameView)
    |> render("index.json", games: games)
  end
end
