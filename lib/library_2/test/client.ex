defmodule Library2.Test.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)

  end
end
