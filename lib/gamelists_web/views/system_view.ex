defmodule GamelistsWeb.SystemView do
  use GamelistsWeb, :view
  alias GamelistsWeb.SystemView

  def render("index.json", %{systems: systems}) do
    %{data: render_many(systems, SystemView, "system.json")}
  end

  def render("system.json", %{system: system}) do
    system
  end
end
