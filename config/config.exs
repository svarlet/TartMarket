# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tart_market,
  ecto_repos: [TartMarket.Repo]

# Configures the endpoint
config :tart_market, TartMarketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3c/Hk01mlkAzgAZS+qrKRKdYr+6/Mcc6GDoxLHaAR0pCia5FCZlO0WI/JZ2DlnqO",
  render_errors: [view: TartMarketWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TartMarket.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, [default_scope: "email,public_profile,user_friends"]}
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
