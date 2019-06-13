defmodule Plantasia.Repo do
  use Ecto.Repo,
    otp_app: :plantasia,
    adapter: Ecto.Adapters.Postgres
end
