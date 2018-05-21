use Mix.Config

config :gamelists, GamelistsWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :gamelists, GamelistsWeb.Endpoint,
  load_from_system_env: true,
  server: true,
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "game-lists.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :gamelists, Gamelists.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: 1

config :gamelists,
  issuer: "gamelists",
  secret_key: "${SECRET_KEY_BASE}"
