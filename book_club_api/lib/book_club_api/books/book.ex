defmodule BookClubApi.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string
    field :description, :string
    field :published_year, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :isbn, :description, :published_year])
    |> validate_required([:title, :author, :isbn, :description, :published_year])
  end
end
