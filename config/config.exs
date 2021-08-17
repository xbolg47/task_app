# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :task_app,
  ecto_repos: [TaskApp.Repo]

# Configures the endpoint
config :task_app, TaskAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9SQn0047PcNxIBKikDuNjHHu33QHuFg2MP5Wj8XkzYFi+Q3MASRrqSFk0tEvmY7A",
  render_errors: [view: TaskAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TaskApp.PubSub,
  live_view: [signing_salt: "YiXFmhXG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :task_app, :pow,
  user: TaskApp.Users.User,
  repo: TaskApp.Repo,
  web_module: TaskAppWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: TaskAppWeb.PowMailer

config :task_app, :pow_assent,
  providers: [
    github: [
      client_id: "dbb33616f217af064d26",
      client_secret: "dbec42e65525115086b11d04cc7dd39b354b337a",
      strategy: Assent.Strategy.Github
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
