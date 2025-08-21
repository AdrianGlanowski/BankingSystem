defmodule BankingSystem.Repo.Migrations.CreateTypesOfAccounts do
  use Ecto.Migration

  def change do
    create table("account_types") do
      add :name_of_account_type, :string
    end
  end
end
