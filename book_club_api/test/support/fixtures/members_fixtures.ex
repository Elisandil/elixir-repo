defmodule BookClubApi.MembersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookClubApi.Members` context.
  """

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{
        email: "some email",
        joined_at: ~D[2026-01-17],
        name: "some name"
      })
      |> BookClubApi.Members.create_member()

    member
  end
end
