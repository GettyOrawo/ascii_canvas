defmodule AsciiCanvas.Application do
	def start(_type, _args) do
	  children = [
	    AsciiCanvas.Repo,
	  ]
	  opts = [strategy: :one_for_one, name: AsciiCanvas.Supervisor]

      Supervisor.start_link(children, opts)
	end
end