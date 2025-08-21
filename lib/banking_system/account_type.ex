defmodule BankingSystem.AccountType do
  use Ecto.Schema

  schema "account_types" do
    field :name_of_account_type, :string

  end
end
