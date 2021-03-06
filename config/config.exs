# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gamelists, ecto_repos: [Gamelists.Repo]

# Configures the endpoint
config :gamelists, GamelistsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "h+xpRPhrMaRM37bsx2U/TunFaYw1Ffy6ctI/IHkVBmgP4RXESqmZq4Sq0BAK3hSL",
  render_errors: [view: GamelistsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gamelists.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :gamelists,
  issuer: "gamelists",
  secret_key: "MFckdG6YcMow2HF2rOjkruV+Ya9o3TYhoMTvkjpDKDt6a0k75JIIHxl1OQao13LZ"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
