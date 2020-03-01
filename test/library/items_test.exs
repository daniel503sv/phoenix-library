defmodule Library.ItemsTest do
  use Library.DataCase

  alias Library.Items

  describe "books" do
    alias Library.Items.Book

    @valid_attrs %{author: "some author", category: "some category", name: "some name"}
    @update_attrs %{author: "some updated author", category: "some updated category", name: "some updated name"}
    @invalid_attrs %{author: nil, category: nil, name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Items.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Items.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Items.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.category == "some category"
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Items.update_book(book, @update_attrs)
      assert book.author == "some updated author"
      assert book.category == "some updated category"
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_book(book, @invalid_attrs)
      assert book == Items.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Items.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Items.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Items.change_book(book)
    end
  end
end
