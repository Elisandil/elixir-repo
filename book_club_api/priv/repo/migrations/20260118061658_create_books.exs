defmodule BookClubApi.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :author, :string
      add :isbn, :string
      add :description, :text
      add :published_year, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
