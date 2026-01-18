defmodule BookClubApiWeb.MemberControllerTest do
  use BookClubApiWeb.ConnCase

  import BookClubApi.MembersFixtures
  alias BookClubApi.Members.Member

  @create_attrs %{
    name: "some name",
    email: "some email",
    joined_at: ~D[2026-01-17]
  }
  @update_attrs %{
    name: "some updated name",
    email: "some updated email",
    joined_at: ~D[2026-01-18]
  }
  @invalid_attrs %{name: nil, email: nil, joined_at: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all members", %{conn: conn} do
      conn = get(conn, ~p"/api/members")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create member" do
    test "renders member when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/members", member: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/members/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "joined_at" => "2026-01-17",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/members", member: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update member" do
    setup [:create_member]

    test "renders member when data is valid", %{conn: conn, member: %Member{id: id} = member} do
      conn = put(conn, ~p"/api/members/#{member}", member: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/members/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "joined_at" => "2026-01-18",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, member: member} do
      conn = put(conn, ~p"/api/members/#{member}", member: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete member" do
    setup [:create_member]

    test "deletes chosen member", %{conn: conn, member: member} do
      conn = delete(conn, ~p"/api/members/#{member}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/members/#{member}")
      end
    end
  end

  defp create_member(_) do
    member = member_fixture()

    %{member: member}
  end
end
