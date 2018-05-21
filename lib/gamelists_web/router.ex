defmodule GamelistsWeb.Router do
  use GamelistsWeb, :router

  pipeline :auth do
    plug(Gamelists.Auth.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", GamelistsWeb do
    # Use the default browser stack
    pipe_through([:browser, :auth])

    get("/", PageController, :index)
  end

  scope "/", GamelistsWeb do
    pipe_through([:browser, :auth, :ensure_auth])
    get("/secret", PageController, :secret)
  end

  # Other scopes may use custom stacks.
  scope "/api", GamelistsWeb do
    pipe_through(:api)
    resources("/games", GameController, only: [:index, :show])
    resources("/systems", SystemController, only: [:index, :show])
  end
end
