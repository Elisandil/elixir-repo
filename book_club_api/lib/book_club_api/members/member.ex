defmodule BookClubApi.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :name, :string
    field :email, :string
    field :joined_at, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :joined_at])
    |> validate_required([:name, :email, :joined_at])
  end
end
