defmodule BankingSystem.Repo do
  use Ecto.Repo,
    otp_app: :banking_system,
    adapter: Ecto.Adapters.Postgres
end
