defmodule BookClubApi.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :joined_at, :date

      timestamps(type: :utc_datetime)
    end
  end
end
