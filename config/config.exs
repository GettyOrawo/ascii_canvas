import Config

config :ascii_canvas, AsciiCanvas.Repo,
  database: "ascii_canvas_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432,
  migration_primary_key: [name: :id, type: :binary_id]

config :ascii_canvas, ecto_repos: [AsciiCanvas.Repo]
