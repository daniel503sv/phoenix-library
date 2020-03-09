defmodule Library.Site do
  @moduledoc """
  The Site context.
  """

  import Ecto.Query, warn: false
  alias Library.Repo
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias Library.Site.Author

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of authors using filtrex
filters.

## Examples

    iex> list_authors(%{})
    %{authors: [%Author{}], ...}
"""
@spec paginate_authors(map) :: {:ok, map} | {:error, any}
def paginate_authors(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:authors), params["author"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_authors(filter, params) do
    {:ok,
      %{
        authors: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_authors(filter, params) do
  Author
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

@doc """
Returns the list of authors.

## Examples

    iex> list_authors()
    [%Author{}, ...]

"""
def list_authors do
  Repo.all(Author)
end

@doc """
Gets a single author.

Raises `Ecto.NoResultsError` if the Author does not exist.

## Examples

    iex> get_author!(123)
    %Author{}

    iex> get_author!(456)
    ** (Ecto.NoResultsError)

"""
def get_author!(id), do: Repo.get!(Author, id)

@doc """
Creates a author.

## Examples

    iex> create_author(%{field: value})
    {:ok, %Author{}}

    iex> create_author(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_author(attrs \\ %{}) do
  %Author{}
  |> Author.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a author.

## Examples

    iex> update_author(author, %{field: new_value})
    {:ok, %Author{}}

    iex> update_author(author, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_author(%Author{} = author, attrs) do
  author
  |> Author.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a Author.

## Examples

    iex> delete_author(author)
    {:ok, %Author{}}

    iex> delete_author(author)
    {:error, %Ecto.Changeset{}}

"""
def delete_author(%Author{} = author) do
  Repo.delete(author)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking author changes.

## Examples

    iex> change_author(author)
    %Ecto.Changeset{source: %Author{}}

"""
def change_author(%Author{} = author) do
  Author.changeset(author, %{})
end

defp filter_config(:authors) do
  defconfig do
    text :name
      text :biography
      
  end
end
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias Library.Site.Book

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of books using filtrex
filters.

## Examples

    iex> list_books(%{})
    %{books: [%Book{}], ...}
"""
@spec paginate_books(map) :: {:ok, map} | {:error, any}
def paginate_books(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:books), params["book"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_books(filter, params) do
    {:ok,
      %{
        books: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_books(filter, params) do
  Book
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

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
Deletes a Book.

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

defp filter_config(:books) do
  defconfig do
    text :title
      text :edition
      text :summary
      
  end
end
end
