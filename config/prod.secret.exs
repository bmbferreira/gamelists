use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :gamelists, GamelistsWeb.Endpoint, secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
# config :gamelists, Gamelists.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "postgres",
#   password: "postgres",
#   database: "gamelists_prod",
#   pool_size: 15

config :gamelists, GamelistsWeb.Endpoint,
  load_from_system_env: true,
  # http: [port: {:system, "PORT"}], # Uncomment this line if you are running Phoenix 1.2
  # Without this line, your app will not start the web server!
  server: true,
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "game-lists.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :gamelists, Gamelists.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  # Free tier db only allows 1 connection
  pool_size: 1
