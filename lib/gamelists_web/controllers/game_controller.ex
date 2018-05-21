defmodule GamelistsWeb.GameController do
  use GamelistsWeb, :controller

  alias Gamelists.Games

  action_fallback(GamelistsWeb.FallbackController)

  def index(conn, _params) do
    games = Games.list_games()
    render(conn, "index.json", games: games)
  end

  def show(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    render(conn, "show.json", game: game)
  end
end
