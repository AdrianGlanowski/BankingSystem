defmodule BankingSystem.Account do
  use Ecto.Schema
  require Ecto.Query

  schema "accounts" do
    field :ban, :integer, primary_key: true  #bank account number (as in IBAN)
    field :balance, :decimal
    belongs_to :type_of_account, BankingSystem.AccountType
    belongs_to :user_id, BankingSystem.User
    field :opened_on, :utc_datetime
    field :isopen, :boolean
  end

  def get_all() do
    BankingSystem.Repo.all(BankingSystem.User)
  end
end
