defmodule BookClubApi.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  alias BookClubApi.Reviews.Review

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :name, :string
    field :email, :string
    field :joined_at, :date
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :reviews, Review

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :joined_at])
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 2, max: 100)
    |> validate_email()
    |> validate_joined_at()
    |> unique_constraint(:email)
  end

  def registration_changeset(member, attrs) do
    member
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 8, max: 120)
    |> hash_password()
  end

  defp validate_email(changeset) do
    changeset
    |> validate_format(:email, ~r/^[\w._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, message: "is not a valid email")
    |> validate_length(:email, min: 5, max: 255)
  end

  defp validate_joined_at(changeset) do
    validate_change(changeset, :joined_at, fn :joined_at, joined_at ->
      if joined_at && Date.compare(joined_at, Date.utc_today()) == :gt do
        [joined_at: "impossible to join in a future date"]
      else
        []
      end
    end)
  end

  defp hash_password(changeset) do
    case get_change(changeset, :password) do
      nil ->
        changeset

      password ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
    end
  end
end
