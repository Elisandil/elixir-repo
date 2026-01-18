defmodule BookClubApi.Repo.Migrations.AddUniqueConstraints do
  use Ecto.Migration

  def change do
    create unique_index(:books, [:isbn])
    create unique_index(:members, [:email])
    create unique_index(:reviews, [:book_id, :member_id])
  end
end
