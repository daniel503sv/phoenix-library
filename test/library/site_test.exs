defmodule Library.SiteTest do
  use Library.DataCase

  alias Library.Site

  describe "authors" do
    alias Library.Site.Author

    @valid_attrs %{biography: "some biography", name: "some name"}
    @update_attrs %{biography: "some updated biography", name: "some updated name"}
    @invalid_attrs %{biography: nil, name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Site.create_author()

      author
    end

    test "paginate_authors/1 returns paginated list of authors" do
      for _ <- 1..20 do
        author_fixture()
      end

      {:ok, %{authors: authors} = page} = Site.paginate_authors(%{})

      assert length(authors) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Site.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Site.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Site.create_author(@valid_attrs)
      assert author.biography == "some biography"
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Site.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = Site.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.biography == "some updated biography"
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Site.update_author(author, @invalid_attrs)
      assert author == Site.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Site.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Site.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Site.change_author(author)
    end
  end

  describe "books" do
    alias Library.Site.Book

    @valid_attrs %{edition: "some edition", summary: "some summary", title: "some title"}
    @update_attrs %{edition: "some updated edition", summary: "some updated summary", title: "some updated title"}
    @invalid_attrs %{edition: nil, summary: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Site.create_book()

      book
    end

    test "paginate_books/1 returns paginated list of books" do
      for _ <- 1..20 do
        book_fixture()
      end

      {:ok, %{books: books} = page} = Site.paginate_books(%{})

      assert length(books) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Site.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Site.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Site.create_book(@valid_attrs)
      assert book.edition == "some edition"
      assert book.summary == "some summary"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Site.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Site.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.edition == "some updated edition"
      assert book.summary == "some updated summary"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Site.update_book(book, @invalid_attrs)
      assert book == Site.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Site.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Site.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Site.change_book(book)
    end
  end
end
