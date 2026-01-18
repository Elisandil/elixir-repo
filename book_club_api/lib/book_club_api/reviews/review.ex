defmodule BookClubApi.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "reviews" do
    field :rating, :integer
    field :comment, :string
    field :book_id, :binary_id
    field :member_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:rating, :comment, :book_id, :member_id])
    |> validate_required([:rating, :book_id, :member_id])
    |> validate_rating()
    |> validate_length(:comment, min: 5, max: 5000)
    |> foreign_key_constraint(:book_id)
    |> foreign_key_constraint(:member_id)
    |> unique_constraint([:book_id, :member_id], message: "A review already exists for this book and member")
  end

  defp validate_rating(changeset) do
    changeset
    |> validate_number(:rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, message: "Rating must be between 0 and 10")
  end
end
