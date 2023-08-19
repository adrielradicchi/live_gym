defmodule LiveGym.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveGym.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveGym.PubSub},
      # Start Finch
      {Finch, name: LiveGym.Finch}
      # Start a worker by calling: LiveGym.Worker.start_link(arg)
      # {LiveGym.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: LiveGym.Supervisor)
  end
end
