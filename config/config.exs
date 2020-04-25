# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :library_2,
  ecto_repos: [Library2.Repo]

# Configures the endpoint
config :library_2, Library2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yXUf4l/uhd+KBMrExKdWwXMbUz5qXuXrhwUc1mdaFnMXTfY+py7ws+wiUUlzdHmn",
  render_errors: [view: Library2Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Library2.PubSub,
  live_view: [signing_salt: "RFtyR56n"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
