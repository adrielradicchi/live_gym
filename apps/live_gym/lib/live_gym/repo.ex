defmodule LiveGym.Repo do
  use Ecto.Repo,
    otp_app: :live_gym,
    adapter: Ecto.Adapters.Postgres
end
