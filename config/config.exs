# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :plantasia,
  ecto_repos: [Plantasia.Repo]

# Configures the endpoint
config :plantasia, PlantasiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OjaqQHmhHxVfu2gQEJ9EN7EwaBa1UrZ4rYQTiln2nbHTP1vY34p7HpfYq2tm2Bpy",
  render_errors: [view: PlantasiaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Plantasia.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
