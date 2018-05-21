defmodule GamelistsWeb.GameControllerTest do
  use GamelistsWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, game_path(conn, :index))
      assert json_response(conn, 200)["data"]
    end
  end
end
