defmodule BookClubApi.MembersTest do
  use BookClubApi.DataCase

  alias BookClubApi.Members

  describe "members" do
    alias BookClubApi.Members.Member

    import BookClubApi.MembersFixtures

    @invalid_attrs %{name: nil, email: nil, joined_at: nil}

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Members.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Members.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      valid_attrs = %{name: "some name", email: "some email", joined_at: ~D[2026-01-17]}

      assert {:ok, %Member{} = member} = Members.create_member(valid_attrs)
      assert member.name == "some name"
      assert member.email == "some email"
      assert member.joined_at == ~D[2026-01-17]
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", joined_at: ~D[2026-01-18]}

      assert {:ok, %Member{} = member} = Members.update_member(member, update_attrs)
      assert member.name == "some updated name"
      assert member.email == "some updated email"
      assert member.joined_at == ~D[2026-01-18]
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_member(member, @invalid_attrs)
      assert member == Members.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Members.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Members.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Members.change_member(member)
    end
  end
end
