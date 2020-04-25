defmodule Library2.TestTest do
  use Library2.DataCase

  alias Library2.Test

  describe "authors" do
    alias Library2.Test.Author

    @valid_attrs %{biography: "some biography", birthdate: ~D[2010-04-17], name: "some name"}
    @update_attrs %{biography: "some updated biography", birthdate: ~D[2011-05-18], name: "some updated name"}
    @invalid_attrs %{biography: nil, birthdate: nil, name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Test.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Test.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Test.create_author(@valid_attrs)
      assert author.biography == "some biography"
      assert author.birthdate == ~D[2010-04-17]
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Test.update_author(author, @update_attrs)
      assert author.biography == "some updated biography"
      assert author.birthdate == ~D[2011-05-18]
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_author(author, @invalid_attrs)
      assert author == Test.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Test.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Test.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Test.change_author(author)
    end
  end

  describe "categories" do
    alias Library2.Test.Category

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Test.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Test.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Test.create_category(@valid_attrs)
      assert category.description == "some description"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Test.update_category(category, @update_attrs)
      assert category.description == "some updated description"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_category(category, @invalid_attrs)
      assert category == Test.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Test.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Test.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Test.change_category(category)
    end
  end

  describe "books" do
    alias Library2.Test.Book

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Test.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Test.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Test.create_book(@valid_attrs)
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Test.update_book(book, @update_attrs)
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_book(book, @invalid_attrs)
      assert book == Test.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Test.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Test.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Test.change_book(book)
    end
  end

  describe "clients" do
    alias Library2.Test.Client

    @valid_attrs %{email: "some email", name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, name: nil, phone: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Test.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Test.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Test.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Test.create_client(@valid_attrs)
      assert client.email == "some email"
      assert client.name == "some name"
      assert client.phone == "some phone"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Test.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Test.update_client(client, @update_attrs)
      assert client.email == "some updated email"
      assert client.name == "some updated name"
      assert client.phone == "some updated phone"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Test.update_client(client, @invalid_attrs)
      assert client == Test.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Test.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Test.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Test.change_client(client)
    end
  end
end
