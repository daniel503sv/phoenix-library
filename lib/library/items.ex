defmodule Library.Items do
  @moduledoc """
  The Items context.
  """

  import Ecto.Query, warn: false
  alias Library.Repo

  alias Library.Items.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{source: %Book{}}

  """
  def change_book(%Book{} = book) do
    Book.changeset(book, %{})
  end

  alias Library.Items.BookItem

  @doc """
  Returns the list of book_items.

  ## Examples

      iex> list_book_items()
      [%BookItem{}, ...]

  """
  def list_book_items do
    Repo.all(BookItem)
  end

  @doc """
  Gets a single book_item.

  Raises `Ecto.NoResultsError` if the Book item does not exist.

  ## Examples

      iex> get_book_item!(123)
      %BookItem{}

      iex> get_book_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_item!(id), do: Repo.get!(BookItem, id)

  @doc """
  Creates a book_item.

  ## Examples

      iex> create_book_item(%{field: value})
      {:ok, %BookItem{}}

      iex> create_book_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_item(attrs \\ %{}) do
    %BookItem{}
    |> BookItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_item.

  ## Examples

      iex> update_book_item(book_item, %{field: new_value})
      {:ok, %BookItem{}}

      iex> update_book_item(book_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_item(%BookItem{} = book_item, attrs) do
    book_item
    |> BookItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_item.

  ## Examples

      iex> delete_book_item(book_item)
      {:ok, %BookItem{}}

      iex> delete_book_item(book_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_item(%BookItem{} = book_item) do
    Repo.delete(book_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_item changes.

  ## Examples

      iex> change_book_item(book_item)
      %Ecto.Changeset{source: %BookItem{}}

  """
  def change_book_item(%BookItem{} = book_item) do
    BookItem.changeset(book_item, %{})
  end
end
