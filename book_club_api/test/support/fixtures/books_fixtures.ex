defmodule BookClubApi.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookClubApi.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        description: "some description",
        isbn: "some isbn",
        published_year: 42,
        title: "some title"
      })
      |> BookClubApi.Books.create_book()

    book
  end
end
