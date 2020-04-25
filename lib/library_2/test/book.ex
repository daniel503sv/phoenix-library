defmodule Library2.Test.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias Library2.Test.{Category,Author}

  schema "books" do
    field :name, :string
    #field :author_id, :id
    #field :category_id, :id

    belongs_to :category, Category
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name,:author_id,:category_id])
    |> validate_required([:name,:author_id,:category_id])
  end
end
