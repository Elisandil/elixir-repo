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
    |> validate_required([:title, :author])
    |> validate_length(:title, min: 1, max: 255)
    |> validate_length(:author, min: 1, max: 255)
    |> validate_length(:description, max: 10000)
    |> validate_isbn()
    |> validate_published_year()
    |> unique_constraint(:isbn)
  end

  defp validate_isbn(changeset) do
    changeset
    |> validate_format(:isbn, ~r/^(?:\d{10}|\d{13})$/, message: "the format is invalid, it should be 10 or 13 digits")
  end

  defp validate_published_year(changeset) do
    current_year = Date.utc.today().year

    changeset
    |> validate_number(:published_year, greater_than_or_equal_to: 1900, less_than_or_equal_to: current_year,
        message: "it needs to be between 1900 and the current year")
  end
end
