defmodule BankingSystem.User do
  use Ecto.Schema
  require Ecto.Query

  schema "users" do
    field :name, :string
    field :last_name, :string
    field :birth_date, :date
    field :gender, :string
  end

  def get_all() do
    BankingSystem.Repo.all(BankingSystem.User)
  end

  defp changeset(user, map_of_changes) do
    user
    |> Ecto.Changeset.cast(map_of_changes, [:name, :last_name, :gender, :birth_date])
    |> Ecto.Changeset.validate_required([:name, :last_name, :gender, :birth_date])
    |> Ecto.Changeset.update_change(:name, &String.trim/1)
    |> Ecto.Changeset.update_change(:last_name, &String.trim/1)
  end

  def register(name, last_name, gender, birth_date) do
    %BankingSystem.User{}
    |> changeset(%{name: name, last_name: last_name, gender: gender, birth_date: birth_date})
    |> BankingSystem.Repo.insert()
  end
end
