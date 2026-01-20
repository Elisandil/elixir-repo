defmodule BookClubApi.Repo.Migrations.AddPasswordToMembers do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :password_hash, :string
    end
  end
end
