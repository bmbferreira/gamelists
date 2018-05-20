defmodule GamelistsWeb.GameView do
  use GamelistsWeb, :view
  alias GamelistsWeb.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{
      id: game.id,
      system: game.id,
      release_date: game.release_date,
      name: game.name,
      publisher: game.publisher
    }
  end
end
