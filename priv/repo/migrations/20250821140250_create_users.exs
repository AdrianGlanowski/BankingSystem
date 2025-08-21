defmodule BankingSystem.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string
      add :last_name, :string
      add :birth_date, :date
      add :gender, :string, size: 1 #F/M
    end

    create constraint("users", :male_or_female, check: "gender = 'M' or gender = 'F'")
  end
end
