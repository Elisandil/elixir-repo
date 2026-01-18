defmodule BookClubApi.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :rating, :integer
      add :comment, :text
      add :book_id, references(:books, on_delete: :nothing, type: :binary_id)
      add :member_id, references(:members, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:reviews, [:book_id])
    create index(:reviews, [:member_id])
  end
end
