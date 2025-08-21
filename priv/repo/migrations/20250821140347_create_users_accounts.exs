defmodule BankingSystem.Repo.Migrations.CreateUsersAccounts do
  use Ecto.Migration

  def change do
    #bank_number = 2052_2014

    create table("accounts", primary_key: false) do
      add :ban, :integer, primary_key: true  #bank account number (as in IBAN)
      add :balance, :decimal
      add :type_of_account, references(:account_types)
      add :user_id, references(:users)
      add :opened_on, :utc_datetime
      add :isopen, :boolean
    end

    create constraint("accounts", :balance_must_non_negative, check: "balance >= 0")
  end
end
