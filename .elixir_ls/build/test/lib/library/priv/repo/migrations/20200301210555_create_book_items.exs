defmodule Library.Repo.Migrations.CreateBookItems do
  use Ecto.Migration

  def change do
    create table(:book_items) do
      add :book_items, :string
      add :book_id, :integer
      timestamps()
    end
  end
end
