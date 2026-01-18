defmodule BookClubApi.BooksTest do
  use BookClubApi.DataCase

  alias BookClubApi.Books

  describe "books" do
    alias BookClubApi.Books.Book

    import BookClubApi.BooksFixtures

    @invalid_attrs %{description: nil, title: nil, author: nil, isbn: nil, published_year: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{description: "some description", title: "some title", author: "some author", isbn: "some isbn", published_year: 42}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.description == "some description"
      assert book.title == "some title"
      assert book.author == "some author"
      assert book.isbn == "some isbn"
      assert book.published_year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", author: "some updated author", isbn: "some updated isbn", published_year: 43}

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.description == "some updated description"
      assert book.title == "some updated title"
      assert book.author == "some updated author"
      assert book.isbn == "some updated isbn"
      assert book.published_year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
