defmodule Library.Site.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :edition, :string
    field :summary, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :edition, :summary])
    |> validate_required([:title, :edition, :summary])
  end
end
