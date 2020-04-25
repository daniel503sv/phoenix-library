defmodule Library2Web.BookController do
  use Library2Web, :controller

  alias Library2.Test
  alias Library2.Test.Book

  def index(conn, _params) do
    books = Test.list_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Test.change_book(%Book{})
    authors = Test.list_authors
    |> Enum.map(&{&1.name, &1.id})
    categories = Test.list_categories
    |> Enum.map(&{&1.name, &1.id})
    render(conn, "new.html", changeset: changeset, authors: authors, categories: categories)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"book" => book_params}) do
    case Test.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Test.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Test.get_book!(id)
    changeset = Test.change_book(book)
    authors = Test.list_authors
    |> Enum.map(&{&1.name, &1.id})
    categories = Test.list_categories
    |> Enum.map(&{&1.name, &1.id})
    render(conn, "edit.html", book: book, changeset: changeset, authors: authors, categories: categories)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Test.get_book!(id)

    case Test.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Test.get_book!(id)
    {:ok, _book} = Test.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
