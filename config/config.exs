# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :listen_too,
  ecto_repos: [ListenToo.Repo]

# Configures the endpoint
config :listen_too, ListenTooWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hqvmKuIR5URvQa34Nno56R+2P26RYgQ95oio2YIcfxQ1+y1x7ztvzJK5j6+TSvff",
  render_errors: [view: ListenTooWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ListenToo.PubSub,
  live_view: [signing_salt: "5kYo+n1G"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
