defmodule Library2.Test.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :biography, :string
    field :birthdate, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :biography, :birthdate])
    |> validate_required([:name, :biography, :birthdate])
  end
end
